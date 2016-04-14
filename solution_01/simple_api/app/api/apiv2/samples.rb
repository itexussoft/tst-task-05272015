class APIV2::Samples < APIV1::Samples

  protected

  def self.init_resource
    resource :samples do

      Rails.logger.error '!!!!!!! Second inited'

      get ':id' do
        Rails.logger.error '!!!!!!!!!! Second'
        sample = ::Sample.find(params[:id])
        present sample, with: APIV2::Presenters::SamplePresenter
      end
    end
    super
  end

  init_resource

end
