module JIRA
  module Resource

    class TransitionFactory < JIRA::BaseFactory # :nodoc:
    end

    class Transition < JIRA::Base
      nested_collections true

      has_one :issue, :class => JIRA::Resource::Issue, :attribute_key => 'issue'
      has_one :status, :class => JIRA::Resource::Status, :attribute_key => 'to'

      def save!(attrs={})
        attrs.merge!( :transition => { :id => id } )
        client.send( :post, "#{issue.url}/transitions", attrs.to_json )
        @expanded = false
        true
      end

      def save(attrs={})
        super
      end
    end
  end
end