require 'sidekiq'
require 'filewatcher'

class FileWatcherJob
  include Sidekiq::Worker

  def perform(directory_to_watch)
    FileWatcher.new(directory_to_watch).watch do |filename|
      if File.file?(filename) && !Title.exists?(file_name: filename)
        Title.create(name: filename, content_url: '#content/{filename}')
        puts "Created a Title record with file_name: #{filename}"
      end
    end
  end
end
