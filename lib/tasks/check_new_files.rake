namespace :check_new_files do
  desc 'Create Title model for new files'
  task create_title_model: :environment do
    Dir.glob('/Volumes/home/content/*').each do |file_path|
      next unless File.file?(file_path)

      file_name = File.basename(file_path)
      Title.create(name: file_name, description: 'TBD', content_url: "content/#{file_name}",
                   user: User.first)
    end
  end
end
