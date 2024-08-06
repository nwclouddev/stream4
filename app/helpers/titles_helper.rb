# frozen_string_literal: true

require 'streamio-ffmpeg'

# helps provide stuff
module TitlesHelper
  def create_thumbnail(video_path, thumbnail_path)
    movie = FFMPEG::Movie.new(video_path)
    movie.screenshot(thumbnail_path, seek_time: 10)
  end
end
