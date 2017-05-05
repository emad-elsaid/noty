require 'open-uri'
require 'yaml'
require 'noty/storage'
require 'noty/helpers'

module Noty
  class Bookmark
    attr_accessor :path, :url, :title

    def initialize(path)
      content = File.exist?(path) ? YAML.load_file(path) : ''

      @path = path
      @url = content['url']
      @title = content['title']
    end

    def self.from_url(url)
      file_path = File.join(STORAGE_PATH, Time.now.to_i.to_s + '.bookmark')
      content = begin
                  open(url).read
                rescue
                  ''
                end
      bookmark = new(file_path)
      bookmark.url = url
      bookmark.title = content.match(%r{<title>(.+)<\/title>}im).to_a[1]
      bookmark
    end

    def save
      File.write(path, to_yaml)
    end

    def delete
      File.delete path
    end

    def open
      Helpers.open_url url
    end

    def edit
      Helpers.edit path
    end

    def copy
      Helpers.copy url
    end

    def to_s(short = false)
      short ? title.to_s : "#{title} (#{url})"
    end

    private

    def to_yaml
      {
        'url' => url,
        'title' => title
      }.to_yaml
    end
  end
end
