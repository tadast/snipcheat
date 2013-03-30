require 'rexml/document'
require 'crack/xml' # Tmp fix https://github.com/jnunemaker/crack/pull/42

module Snipcheat
  class Snippet
    attr_reader :scope, :content, :description, :tab_trigger
    def initialize(path)
      @path = path
      load
    end

    def load
      mash.each do |key, value|
        underscorized = key.to_s
          .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
          .gsub(/([a-z\d])([A-Z])/,'\1_\2')
          .tr("-", "_")
          .downcase
        instance_variable_set("@#{underscorized}", value.to_s)
      end
    end

  private
    def mash
      @_mash ||= begin
        f = File.open(@path)
        Crack::XML.parse(f.read)['snippet']
      ensure
        f.close
      end
    end
  end
end