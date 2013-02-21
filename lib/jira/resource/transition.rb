module JIRA
  module Resource

    class TransitionFactory < JIRA::BaseFactory # :nodoc:
    end

    class Transition < JIRA::Base
      nested_collections true

      has_one :issue, :class => JIRA::Resource::Issue, :attribute_key => 'issue'
      has_one :status, :class => JIRA::Resource::Status, :attribute_key => 'to'
    end
  end
end