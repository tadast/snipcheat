require 'snipcheat/snippet'

module Snipcheat
  class SnippetDir
    def initialize(path)
      @path = path
    end

    def empty?
      filenames.empty?
    end

    def snippets
      @_snippets ||= filenames.map{ |fn| Snippet.new(File.join(@path, fn)) }
    end

    def filenames
      @_filenames ||= Dir.new(@path).select{ |x|
        x.end_with? '.sublime-snippet'
      }.compact
    end
  end
end