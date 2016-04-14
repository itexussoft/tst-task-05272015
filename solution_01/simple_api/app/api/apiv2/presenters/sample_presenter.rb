module APIV2::Presenters::SamplePresenter
  include Roar::JSON
  include Grape::Roar::Representer

  property :id
  property :title
end