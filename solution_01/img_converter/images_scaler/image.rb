module ImagesScaler
  class ImageNotFoundException < StandardError; end

  # This class holds the image's path.
  class Image
    attr_accessor :path

    # Remember the path of image and raise exception if the image wasn't found.
    def initialize(path)
      @path = path
      raise ImageNotFoundException.new('Image not found.') unless File.exists? path
    end
  end
end