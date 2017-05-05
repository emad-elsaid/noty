require 'noty/storage'
require 'noty/helpers'

module Noty
  class Snippet
    attr_accessor :path, :content

    def initialize(path)
      @path = path
      @content = File.exist?(path) ? File.read(path) : ''
    end

    def save
      File.write(path, content)
    end

    def delete
      File.delete path
    end

    def open
      edit
    end

    def copy
      Helpers.copy content
    end

    def edit
      Helpers.edit path
    end

    def to_s(short = false)
      short ? content.tr("\n", ' ')[0..100] : content.to_s
    end
  end
end
