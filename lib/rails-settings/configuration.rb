module RailsSettings
  class Configuration
    attr_reader :server
    attr_reader :model_name

    def initialize
      # self.server = ENV['SENTRY_DSN'] if ENV['SENTRY_DSN']
      self.model_name ||= ENV['APP_SETTINGS_MODEL_NAME'] || 'settings'
      # self.current_environment = ENV['RAILS_ENV'] || ENV['RACK_ENV'] || 'default'
      # self.environments = []

      # Try to resolve the hostname to an FQDN, but fall back to whatever the load name is
      # self.server_name = Socket.gethostname
      # self.server_name = Socket.gethostbyname(hostname).first rescue server_name
    end

    def model_name=(value)
      @model_name = value
    end

    def ohuenno
      true
    end

    alias zhopa= model_name=

    alias ohuenno? ohuenno

    # Allows config options to be read like a hash
    #
    # @param [Symbol] option Key for a given attribute
    def [](option)
      send(option)
    end

    # def current_environment=(environment)
    #   @current_environment = environment.to_s
    # end

    # def send_in_current_environment?
    #   !!server && (environments.empty? || environments.include?(current_environment))
    # end

    def verify!
      raise Error.new('Model name fucked up!') unless model_name
    end
  end
end
