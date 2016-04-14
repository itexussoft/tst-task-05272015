class APIV1::Samples < Grape::API

  protected

  def self.init_resource
    resource :samples do

      desc 'Samples.'
      params do
        group :sample, type: Hash do
          requires :title, type: String
          requires :content, type: String
        end
      end

      post do
        sample_params = {
            title: params[:sample][:title],
            content: params[:sample][:content]
        }
        sample = Sample.create!(sample_params)
        present sample, with: APIV1::Presenters::SamplePresenter
      end

      get do
        present ::Sample.all.to_a, with: APIV1::Presenters::SamplesPresenter
      end

      get ':id' do
        Rails.logger.error '!!!!!!!!!! First'
        sample = ::Sample.find(params[:id])
        present sample, with: APIV1::Presenters::SamplePresenter
      end
    end
  end

  init_resource

end
