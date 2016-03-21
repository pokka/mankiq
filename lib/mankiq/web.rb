require 'sidekiq/web'

module Mankiq
  module Web
    VIEWS_PATH = File.expand_path('../views', __FILE__)

    def self.registered(app)
      app.get "/manual" do
        Dir[Mankiq.config.workers_dir].each {|file| require file }
        @workers = Worker.workers.sort_by { |worker| worker.name }
        erb File.read(File.join(VIEWS_PATH, 'manual_workers.html.erb')), locals: {view_path: VIEWS_PATH}
      end

      app.post "/manual/:name/trigger" do
        halt 404 unless (name = params[:name])

        worker = Worker.workers.detect do |worker|
          worker.name == name
        end

        worker.perform_async if worker
        redirect "#{root_path}/manual"
      end
    end

  end
end

Sidekiq::Web.register(Mankiq::Web)
Sidekiq::Web.tabs["Manual"] = "manual"