# The program takes an initial path and optional scale ratio
# from the command line. Then it scales all found images with jpg, png or jpeg
# extensions in initial directory. If user specified '--help'
# as one of parameters it will show a reference to a user.

# Author::    Pavel Yemelyanau (mailto:p.yemelyanau@gmail.com)

require './images_scaler.rb'


def show_help
  puts 'To use bunch scaler run "./scale /path/to/file" or "./scale /path/to/file 0.5".'
end

show_help if ARGV.include?('--help') || ARGV.include?('-h')

begin
  if ARGV.size == 1
    ImagesScaler::ImagesBunch.new(ARGV[0]).scale
  elsif ARGV.size == 2
    ImagesScaler::ImagesBunch.new(ARGV[0]).scale(ARGV[1].to_f)
  else
    puts 'Wrong number of attributes. For reference run "scale.sh --help"'
  end

rescue ImagesScaler::ImageNotFoundException => e
  puts 'Error: One of the images was not found. Please, try again.'

rescue ImagesScaler::ImageScalerException => e
  puts "Error during scaling images. \n#{e.message}"

rescue ImagesScaler::ImagesBunchException => e
  puts "Error: #{e.message}"

end
