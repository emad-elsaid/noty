require 'fileutils'

module Noty
  STORAGE_PATH = File.expand_path(ENV['NOTES_PATH'] || '~/.notes')
  FileUtils.mkdir_p STORAGE_PATH
end
