module APIV1::Presenters::SamplesPresenter
  include Roar::JSON
  include Grape::Roar::Representer

  collection :entries, extend: APIV1::Presenters::SamplePresenter, as: :samples, embedded: true
end
