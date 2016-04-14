class APIRoot < Grape::API
  mount APIV1::Root
  mount APIV2::Root
end