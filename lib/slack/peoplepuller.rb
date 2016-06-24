require 'slack/peoplepuller/version'
require 'slack/peoplepuller/configuration'
require 'slack-ruby-client'

module Slack
  module Peoplepuller
    Slack.configure do |config|
      config.token = ENV['SLACK_API_TOKEN']
    end

    def self.pull
      client = Slack::Web::Client.new
      groups = client.usergroups_list(include_users: true)
      people = []
      configuration.groups.each do |search_group|
        group = groups.usergroups.find { |group| group.name == search_group }
        raise "Group #{search_group} not found" if group.nil?
        people += group.users
      end

      people.map do |person|
        profile = client.users_info(user: person).user.profile
        { name: profile.real_name_normalized, image: profile.image_original, title: profile.title }
      end.find_all { |person| person.values.all? { |val| val != '' && val != nil } }
    end
  end
end
