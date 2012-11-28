require 'spec_helper'

module Snipcheat
  describe SnippetDir do
    let(:fixtures_dir){ SnippetDir.new(File.join(File.dirname(__FILE__), "fixtures")) }

    describe "#empty?" do
      it "is false for the fixtures dir" do
        fixtures_dir.should_not be_empty
      end

      it "is true for the spec folder" do
        dir = SnippetDir.new(File.join(File.dirname(__FILE__), "..", ".."))
        dir.should be_empty
      end
    end

    describe "#snippets" do
      it "is an array of Snippets" do
        fixtures_dir.snippets.first.should be_a Snippet
      end
    end

    describe "#snippet_filenames" do
      it "finds sample snippet" do
        fixtures_dir.snippet_filenames.should include('sample.sublime-snippet')
      end

      it "does not include no snippet" do
        fixtures_dir.snippet_filenames.should_not include('no.snippet')
      end
    end
  end
end