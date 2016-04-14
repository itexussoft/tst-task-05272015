class APIV1::Root < Grape::API
  prefix 'api/v1'

  format :json
  formatter :json, Grape::Formatter::Roar

  mount APIV1::Samples
end
