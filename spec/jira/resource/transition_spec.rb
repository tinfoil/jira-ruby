require 'spec_helper'

describe JIRA::Resource::Transition do
  let(:client) { mock() }

  describe "relationships" do
    subject {
      JIRA::Resource::Transition.new(client, :attrs => {
        'id' => '123',
        'to' => {'foo' => 'bar'},
        'issue' => {'foo' => 'bar'}
      })
    }

    it "has the correct relationships" do
      subject.should have_one(:status, JIRA::Resource::Status)
      subject.status.foo.should == 'bar'

      subject.should have_one(:issue, JIRA::Resource::Issue)
      subject.issue.foo.should == 'bar'
    end
  end
end