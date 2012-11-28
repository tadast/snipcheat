require 'snipcheat/snippet_dir'

module Snipcheat
  class Task < Thor
    include Thor::Actions

    class_option  :verbose, type: :boolean, aliases: '-v'
    method_option :dir, type: :string, aliases: '-d', desc: "Input directory containing .sublime-snippet files", required: true
    method_option :out, type: :string, aliases: '-o', desc: "Output path for the html file"
    desc "generate", "Generate a cheat sheet file given --dir and -out"
    def generate
      vsay "Looking for snippets in #{options[:dir]}"
      snippets = SnippetDir.new(options[:dir])
      if snippets.empty?
        say "No snippets found in #{options[:dir]}"
        return
      else
        vsay "Found: #{snippets.filenames.join(', ')}"
      end
    end

  private

    def vsay(message)
      if options[:verbose]
        say message
      end
    end
  end
end