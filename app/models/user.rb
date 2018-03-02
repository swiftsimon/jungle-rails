class User < ActiveRecord::Base

  has_secure_password

  def new
    redirect_to '/'
  end

end
