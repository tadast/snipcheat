require 'snipcheat/snippet_dir'
require 'snipcheat/output'

module Snipcheat
  class Task < Thor
    include Thor::Actions

    class_option  :verbose, type: :boolean, aliases: '-v'
    method_option :dir, type: :string, aliases: '-d', desc: "Input directory containing .sublime-snippet files", required: true
    method_option :out, type: :string, aliases: '-o', desc: "Output file. eg ~/ruby-cheatsheet.html. Defaults to cheatsheet.html"
    desc "generate", "Generate a cheat sheet file given --dir and -out"
    def generate
      vsay "Looking for snippets in #{options[:dir]}"
      snippet_dir = SnippetDir.new(options[:dir])
      if snippet_dir.empty?
        say "No snippets found in #{options[:dir]}"
        return
      else
        vsay "Found: #{snippet_dir.filenames.join(', ')}"
        out = options[:out] || 'cheatsheet.html'
        vsay "Writing to #{out}..."
        Output.new(snippet_dir.snippets, out).write
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