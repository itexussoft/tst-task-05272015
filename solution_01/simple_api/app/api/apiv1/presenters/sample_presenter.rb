module APIV1::Presenters::SamplePresenter
  include Roar::JSON
  include Grape::Roar::Representer

  property :id
  property :title
  property :content
end