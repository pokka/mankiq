require "mankiq/version"

module Mankiq

  class Configuration
    attr_accessor :workers_dir
  end

  def self.config
    @configuration ||= Configuration.new
  end

end

require "mankiq/worker"
require "mankiq/web"