require 'noty/version'
require 'noty/ui'
require 'noty/storage'
require 'noty/models/bookmark'
require 'noty/models/snippet'
require 'noty/services/search'

module Noty
  module_function

  def version
    puts "Noty version #{VERSION}"
  end

  def help
    version
    puts <<-EOT
Snippets and bookmarks manager.

Usage:
  noty [command|inputs]

Commands:
  help, -h, --help : print this message
  version, -v, --version : print noty version

Input types:
  url: e.g "http://www.example.com", add URL as a bookmark file
  keyword: search bookmarks and perform action on it, a single word of multiple words or regex, it is passed to "ag silver searcher"
  snippet text: any multiword text, it will search first if no files contain this text you'll be asked if you want to create a snippet for it
EOT
  end

  def search
    keyword = ARGV.join ' '
    result = Services.search(keyword)

    if !result.empty?
      UI.choose result
    elsif keyword.include?(' ')
      choice = ask 'Do you want to save it as a snippet? [y/N]: '
      snippet if choice.casecmp 'y'
    end
  end

  def snippet
    content = ARGV.join ' '
    path = File.join(Noty::STORAGE_PATH, Time.now.to_i.to_s + '.snippet')

    snippet = Snippet.new(path)
    snippet.content = content
    snippet.save
  end

  def bookmark
    bm = Bookmark.from_url(ARGV.first)
    bm.save
    bm.edit
  end
end
