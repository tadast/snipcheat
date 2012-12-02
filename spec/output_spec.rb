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
    end
  end
end