module Mankiq

  module SubclassTracking
    def subclasses(deep = false)
      @subclasses ||= []
    end

    def inherited(klass)
      super
      subclasses << klass
    end
  end

  module Worker
    extend SubclassTracking

    def self.workers
      subclasses(true).select do |klass|
        klass.method_defined?(:perform)
      end
    end

    def self.included(klass)
      super

      klass.extend(SubclassTracking)
      subclasses << klass
    end
  end

end