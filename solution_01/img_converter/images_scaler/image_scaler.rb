module ImagesScaler
  class ImageScalerException < StandardError; end

  # This class holds an image and scales it by specified ratio.
  class ImageScaler

    # Remember an image.
    def initialize(image)
      @image = image
    end

    # Scale image by specified ratio.
    # Raise an error if something goes wrong with rmagick.
    def scale(ratio)
      percentage = ratio * 100

      # add postfix to original file name
      path_to_save = @image.path.gsub(/\.(jpg|jpeg|png)/, "_scaled.\\1")

      # run imagemagick convert to resize, error stream forwrder to stdout stream
      result = `convert #{@image.path} -resize #{percentage}% #{path_to_save} 2>&1`
      raise ImageScalerException.new(result) unless result.empty?

      Image.new(path_to_save)
    end
  end
end
