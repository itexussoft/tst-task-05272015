module ImagesScaler
  class ImagesBunchException < StandardError; end

  # This class holds initial path of a directory with images
  # and images array. The scale method allows to scale all images
  # in initial directory by default 0.5. You are optionally able to
  # specify scale ratio.

  class ImagesBunch
    ALLOWED_TYPES = %w(jpg jpeg png)

    # Remember initial path and images with jpg, jpeg and png extensions.
    # Raise an error when specified in path directory doesn't exist,
    # show a warning when directory doesn't contain images.
    def initialize(path)
      @path = path
      raise ImagesBunchException.new('Directory does not exist.') unless File.directory? path

      $stderr.puts("WARNING: Directory doesn\'t contain images.") if pathes_to_images(path).empty?

      @images = pathes_to_images(path).map{ |p| Image.new(p) }
    end

    # Scales images that were in a directory specified in initial path.
    # Takes scale ratio as an optional parameter. By default scale ratio is 0.5.
    def scale(ratio = 0.5)
      @images.map do |image|
        ImageScaler.new(image).scale(ratio)
      end
    end

    private

      # Return array of pathes of images in a directory with a specified extensions.
      def pathes_to_images(path)
        types = ALLOWED_TYPES.join('|')
        Dir["#{path}/*"].select{|file| file =~ /.*\.(#{types})/}
      end
  end
end