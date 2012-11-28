module Snipcheat
  class Task < Thor
    include Thor::Actions

    method_option :dir, type: :string, aliases: '-d', desc: "Input directory containing .sublime-snippet files", required: true
    method_option :out, type: :string, aliases: '-o', desc: "Output path for the html file"
    desc "generate", "Generate a cheat sheet file given --dir and -out"
    def generate
    end
  end
end