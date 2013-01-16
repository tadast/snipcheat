require 'spec_helper'

module Snipcheat
  describe Output do
    describe "#to_s" do
      it "has all the snippet attributes" do
        snippets = [double(content: 'xyz', tab_trigger: 'ttr', description: 'magic', scope: 'all.files')]
        out = Output.new(snippets, :path).to_s

        out.should match 'xyz'
        out.should match 'ttr'
        out.should match 'magic'
        out.should match 'all.files'
      end

      it "escapes html" do
        snippets = [double(content: '<trololo>', tab_trigger: 'ttr', description: '<trololo>', scope: 'all.files')]
        out = Output.new(snippets, :path).to_s

        out.should match '&lt;trololo&gt;'
        out.should_not match '<trololo>'
      end
    end
  end
end