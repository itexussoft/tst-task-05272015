module API
  module Helpers
    module StrongParameters
      extend Grape::API::Helpers

      def permitted_params
        # don't want to include missing params and want only to
        # return params declared against the current/target endpoint
        @permitted_params ||= declared(params, include_missing: false, include_parent_namespaces: false).to_hash.symbolize_keys
      end
    end
  end
end
