class APIV2::Root < Grape::API
  prefix 'api/v2'

  format :json
  formatter :json, Grape::Formatter::Roar

  mount APIV2::Samples
end
