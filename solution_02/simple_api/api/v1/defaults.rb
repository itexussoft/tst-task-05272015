module API
  module V1
    module Defaults
      extend ActiveSupport::Concern
      included do
        # can change it to provide it in url string
        version 'v1', using: :header, vendor: 'project'
        format :json
        prefix :api
      end
    end
  end
end
