# We can easily add authentication and authorization
# but for this app suppose everyone can do everything.
# For real model it would be probably better to use
# decorators for objects that respond to as_json
# and returns needed data.
module API
  module V1
    class Users < Grape::API
      # Just as example of error's handling.
      rescue_from Models::NotFoundError do |e|
        error_response({ message: "Not found" })
      end

      include API::V1::Defaults

      # it's helpful when you don't want to list
      # all params and use only those that had been
      # included in the request
      helpers API::Helpers::StrongParameters

      resource :users do
        desc "Return all users."
        get do
          Models::User.all
        end

        desc "Return user."
        params do
          requires :id, type: Integer, desc: "User id."
        end
        route_param :id do
          get do
            Models::User.find(params[:id])
          end
        end

        desc "Create a user."
        params do
          requires :id, type: Integer, desc: "User ID."
          requires :name, type: String, desc: "User name."
        end
        post do
          Models::User.create(permitted_params)
        end

        desc "Update a user."
        params do
          requires :id, type: Integer, desc: "User ID."
          requires :name, type: String, desc: "User name."
        end
        route_param :id do
          put do
            Models::User.find(params[:id]).update(permitted_params)
          end
        end

        desc "Delete a user."
        params do
          requires :id, type: Integer, desc: "User ID."
        end
        route_param :id do
          delete  do
            Models::User.find(params[:id]).destroy
          end
        end
      end
    end
  end
end
