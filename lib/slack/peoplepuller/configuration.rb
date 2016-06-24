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
      attr_accessor :slack_api_token, :groups

      def initialize
        @slack_api_token = ''
        @groups = []
      end
    end
  end
end
