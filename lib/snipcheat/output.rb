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
      engine = Haml::Engine.new(template('simple.html.haml'), escape_html: true)
      engine.render(Object.new, snippets: @snippets, css: template('styles.css'))
    end

  private

    def template(filename)
      f = File.open(File.join(File.dirname(__FILE__), '..', 'templates', filename))
      f.read
    ensure
      f.close
    end
  end
end