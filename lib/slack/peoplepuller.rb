require 'slack/peoplepuller/version'
require 'slack/peoplepuller/configuration'
require 'slack-ruby-client'

module Slack
  module Peoplepuller
    Slack.configure do |config|
      config.token = ENV['SLACK_API_TOKEN']
    end

    def self.pull(groups_to_load)
      client = Slack::Web::Client.new
      slack_groups = client.usergroups_list(include_users: true)
      people = []
      groups_to_load.each do |group|
        group = slack_groups.usergroups.find { |slack_group| slack_group.name == group }
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
