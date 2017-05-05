require 'open3'

module Noty
  module Helpers
    module_function

    def edit(file_path)
      editor = ENV['EDITOR'] || 'vi'.freeze
      system "#{editor} #{file_path}"
    end

    def copy(text)
      case RUBY_PLATFORM
      when /darwin/
        Open3.capture2('pbcopy', stdin_data: text)
      when /linux/
        Open3.capture2('xsel --clipboard --input', stdin_data: text)
      end
    end

    def open_url(url)
      case RUBY_PLATFORM
      when /darwin/
        system "open #{url}"
      when /linux/
        system "xdg-open #{url}"
      end
    end
  end
end
