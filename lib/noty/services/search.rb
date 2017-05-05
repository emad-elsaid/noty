module Noty
  module Services
    module_function

    def search(keyword)
      files = `ag -l "#{keyword}" #{STORAGE_PATH}`.lines
      top_matches = files[0...9].map(&:chomp)
      top_matches.map do |file|
        case File.extname(file)
        when '.bookmark'
          Bookmark.new(file)
        when '.snippet'
          Snippet.new(file)
        end
      end
    end
  end
end
