require 'spec_helper'

module Snipcheat
  describe Snippet do
    it "reads all properties from an xml file" do
      snippet_path = File.join(File.dirname(__FILE__), "fixtures", "sample.sublime-snippet")
      snippet = Snippet.new(snippet_path)

      snippet.content.should be_a   String
      snippet.tab_trigger.should eq 'slt'
      snippet.scope.should eq       'text.html.ruby'
      snippet.description.should eq 'stylesheet_link_tag'
    end
  end
end