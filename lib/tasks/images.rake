namespace :images_upload do 
  desc "This task calls for all images upload (Just need to call it once)"
  task :dota_heroes => :environment do
    @heroes_images = Dir.glob("lib/Dota-cropped-heroes/*.png")
    @heroes_images.each do |image|
      # Check if image present.. before creating
      unless Image.where(name: image.split('/').last.split('.').first).present?
        # Check images are running
        puts "Images are running: #{image.split('/').last.split('.').first}"
        # image is 'lib/Dota.../*.png', hence split by / and by . to get the full hero name
        @image_to_be_attached = Image.create(image_category: 0, name: image.split('/').last.split('.').first)
        @image_to_be_attached.raw_file.attach(io: File.open(image), filename: image.split('/').last, content_type: 'image/png')
      end
    end
  end
end
