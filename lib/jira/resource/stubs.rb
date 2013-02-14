# Stub out resource names to prevent loading order issues
module JIRA
  module Resource
    class Attachment < JIRA::Base; end
    class Comment < JIRA::Base; end
    class Component < JIRA::Base; end
    class Issue < JIRA::Base; end
    class IssueType < JIRA::Base; end
    class Priority < JIRA::Base; end
    class Project < JIRA::Base; end
    class Status < JIRA::Base; end
    class User < JIRA::Base; end
    class Version < JIRA::Base; end
    class Worklog < JIRA::Base; end
  end
end