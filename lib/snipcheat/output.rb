require 'haml'

module Snipcheat
  class Output
    def initialize(snippets, out_file)
      @snippets = snippets
      @out_file = out_file
    end

    def write
      File.open(@out_file, 'w') do |f|
        f.write(to_s)
      end
    end

    def to_s
      engine = Haml::Engine.new(template, escape_html: true)
      engine.render(Object.new, snippets: @snippets, css: css)
    end

  private

    def css
      f = File.open(File.join(File.dirname(__FILE__), '..', 'templates', 'styles.css'))
      f.read
    ensure
      f.close
    end

    def template
      f = File.open(File.join(File.dirname(__FILE__), '..', 'templates', 'simple.html.haml'))
      f.read
    ensure
      f.close
    end
  end
end