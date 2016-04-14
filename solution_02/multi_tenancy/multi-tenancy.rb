# It's just as example that covers the majority of
# projects.

#####################################################
#  Models
#####################################################

# Table name: companies
#
#  id           :integer          not null, primary key

# It can be an Account, an Organization model, etc.
class Company
  has_many :users
  has_many :projects
  has_many reviews, through: :projects
end


# Table name: users
#
#  id           :integer          not null, primary key
#  company_id   :integer          not null
class User < ActiveRecord::Base
  belongs_to :company

  validates :company_id, presence: true
end


# Table name: reviews
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  project_id   :integer          not null
class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :user_id, :project_id, presence: true
  validate :project_cannot_belongs_to_another_company

  def project_cannot_belong_to_another_company
    unless project_id.in? Project.for_company(user.company.id).ids
      errors.add(:project_id, "can't belong to the project of another company")
    end
  end

end


# Table name: projects
#
#  id           :integer          not null, primary key
#  company_id   :integer          not null
class Project < ActiveRecord::Base
  belongs_to :company
  has_many :reviews

  validates :company_id, presence: true

  scope :for_company, ->(company_id) { where(company_id: company_id) }
end

########################################################
#   The main purpose of this class is to load records
#   for a company
########################################################
class CompanyRecords
  def initialize(company)
     @company = company
  end

  def users
    @company.users
  end

  def projects
    @company.projects
  end
end

########################################################
#  Controllers
########################################################

# Also if user trying to acess to the record that doesn't
# belong to his tenant or to the just none existing
# record he will see some explanation.
# Maybe it would be more appropriate to use it in particular
# controllers but I left it here.
class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: record_not_found

private
  # we need to provide some current tenant
  def set_tenant
    @tenant = CompanyRecords.new(current_user.company)
  end

  def record_not_found
    message = "#{controller_name.classify} not found." # as example
    redirect_to root_path, alert: message
  end
end

# Projects are common for all company's users.
#
# I don't use before_action here for 'load_projects'
# and 'load_project' because when I write in this way
# it's obvious what's happening in each action.
class ProjectsController < ApplicationController
  # These views are supposed to be visible only
  # for loggen in users so I can find current_user
  # or something like this.
  before_action :set_tenant

  def index
    load_projects
  end

  def show
    load_project
  end

  def new
    load_projects
    @project = current_user.projects.build
  end

  def create
    load_projects
    @project = @projects.build(project_params)
    @project.save
  end

  def update
    load_project
    @project = @project.update_attributes(project_params)
  end

  def destroy
    load_project
    @project.destroy
  end

private

  def load_projects
    @projects = @tenant.projects
  end

  def load_project
    load_projects
    @project = @projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(...)
  end
end


class ReviewsController < ApplicationController

  # to show all company's reviews
  def all
    set_tenant
    @reviews = @tenant.reviews
  end

  # other actions belongs to particular user
  def index
    load_user_reviews
  end

  def show
    load_user_review
  end

  def new
    load_user_reviews
    @review = current_user.reviews.build
  end

  def create
    load_user_reviews
    @review = @reviews.build(review_params)
    @review.save
  end

  def update
    load_user_review
    @review = @review.update_attributes(review_params)
  end

  def destroy
    load_user_review
    @review.destroy
  end

private

  def load_user_reviews
    @reviews = curent_user.reviews
  end

  def load_user_review
    load_user_reviews
    @review = @reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:post_id)
  end
end


