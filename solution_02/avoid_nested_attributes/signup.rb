class SignupError < StandardError; end

class Signup
  attr_reader :errors

  def initialize(opts = {})
    @company = Company.new(name: opts[:company_name])
    # when models are saved user have proper company_id
    @user = @company.users.build(name: opts[:name], email: opts[:email])
    @errors = []
  end

  def save
    begin
      ::Company.transaction do
        raise SignupError, 'Cannot be saved' unless save_records(@company, @user)
      end
      true
    rescue SignupError => e
      false
    end
  end

private

  # we shouldn't use it outside transaction
  # to prevent unwanted models saving
  def save_records(*objects)
    objects.map do |o|
      if o.save
        true
      else
        # we can easily change the format of errors
        (@errors << o.errors.full_messages).flatten!
        false
      end
    end.all?
  end
end
