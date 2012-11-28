module Snipcheat
  class SnippetDir
    def initialize(path)
      @path = path
    end

    def empty?
      snippet_filenames.empty?
    end

    def snippet_filenames
      @_snippet_filenames ||= Dir.new(@path).select{ |x|
        x.end_with? '.sublime-snippet'
      }.compact
    end
  end
end