# :reek:Attribute
module Slack
  module Peoplepuller
    class << self
      attr_accessor :configuration
    end

    def self.configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end

    class Configuration
      attr_accessor :slack_api_token

      def initialize
        @slack_api_token = ''
      end
    end
  end
end
