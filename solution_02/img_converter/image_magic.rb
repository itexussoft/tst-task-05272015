require 'open3'

# This small library was written to resize all png and jpeg
# images inside a directory. Just require 'converter.rb' and
# provide the path as an argument.
#
# == Example
#
# require 'open3'

# This small library was written to resize all png and jpeg
# images inside a directory. Just require 'image_magic.rb' and
# provide the path as an argument.
#
# ==== Example
#
# ImageMagic::Converter.new('/absolute/path/to/your/directoty').batch_resize
#
# or
#
# ImageMagic::Converter.new('relative/path/to/your/directoty/').batch_resize

module ImageMagic

  # Generic ImageMagic exception class
  class ImageMagicError < StandardError; end

  # Use to build ImageMagic command as string
  class ImageMagicCommands
    # All images in the current folder will be resized by 50%
    # of their original size but aspect ration will be kept.
    # The name of resized images will be in the form:
    # {original_file_name}.resized.{format}
    #
    # ==== Attributes
    #
    # * +format+ - format of images: String
    def self.batch_resize format
      "mogrify -resize 50% -format 'resized.#{format}'  *.#{format}"
    end

    #--
    # If more formats would be needed this should be refactored,
    # e.g using method_missing
    #++
    # Returns string for resizing all jpeg images
    def self.resize_all_jpeg
      batch_resize 'jpeg'
    end

    # Returns string for resizing all png images
    def self.resize_all_png
      batch_resize 'png'
    end
  end

  # Execute command
  class ExecuteCmd
    # Executes command and raises an ImageMagicError
    # in case if status isn't successfull
    # othewise returns stdout for the executed command
    #
    # ==== Attributes
    #
    # * +cmd+ - command to be executed: String
    def self.with_error_capturing!(cmd)
      output, err, status = Open3.capture3(cmd)
      raise ImageMagicError, err unless status.success?
      output
    end
  end

  # Execute ImageMagic commands
  class ExecuteImageMagicCmd
    # Does the resize for all images with specified format.
    # In case of error raise it loudly.
    #
    # ==== Attributes
    #
    # * +format+ - format of images: String
    def self.resize!(format)
      cmd = ImageMagicCommands.send("resize_all_#{format}")
      ExecuteCmd.with_error_capturing! cmd
    end
  end

  # Main class that does resizing all png
  # and jpeg images
  class Converter
    # path : contains path without last / symbol
    # formats : contains formats of images that
    #   presents in the folder and included in
    #   the FORMATS constant
    attr_reader :path, :formats

    # Formats to look for
    FORMATS = ['jpeg', 'png']

    # Initialize new instance of Converter
    #
    # ==== Attributes
    #
    # * +path+ - path to the images: String
    #
    # ==== Examples
    #
    # Converter.new('/absolute/path/to/your/directoty')
    # Converter.new('relative/path/to/your/directoty/')
    # Converter.new('some/path/without/last/slash')
    def initialize(path)
      @path = path.chomp('/')
      # Do resize only for existing formats
      @formats = FORMATS.dup.keep_if { |format|  Dir["#{path}/*.#{format}"].any? }
    end

    # Changes the current working directory of the process
    # to the +path+ and resizes all images with formats from +formats+.
    # Error message will be shown if some error occurs during converting
    # otherwise short message pointing that program has finished.
    #
    # ==== Examples
    #
    # c = Converter.new('/absolute/path/to/your/directoty')
    # c.batch_resize
    def batch_resize
      begin
        Dir.chdir(path) do
          formats.each { |format| ExecuteImageMagicCmd.resize! format }
        end
        puts "Done!"
        true
      rescue StandardError => error
        puts error
        false
      end
    end
  end
end
