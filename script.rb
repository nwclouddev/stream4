if File.directory?(folder_path)
  mp4_files = Dir.glob(File.join(folder_path, "*.mp4"))

  if mp4_files.empty?
    puts "No .mp4 files found in the specified folder."
  else
    puts "Found the following .mp4 files:"
    mp4_files.each { |file| Title.create(name: file, content_url: file.split('/Volumes/home/').second)}
  end
else
  puts "Invalid folder path. Please provide a valid path to a folder."
end
