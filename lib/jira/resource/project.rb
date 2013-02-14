module JIRA
  module Resource

    class ProjectFactory < JIRA::BaseFactory # :nodoc:
    end

    class Project < JIRA::Base

      has_one :lead, :class => JIRA::Resource::User
      has_many :components
      has_many :issuetypes, :attribute_key => 'issueTypes'
      has_many :versions
      has_many :issues, :collection_method => :issues_collection

      def self.key_attribute
        :key
      end

      private
      def issues_collection
        response = client.get(client.options[:rest_base_path] + "/search?jql=project%3D'#{key}'")
        json = self.class.parse_json(response.body)
        json['issues'].map do |issue|
          client.Issue.build(issue)
        end
      end

    end

  end
end
