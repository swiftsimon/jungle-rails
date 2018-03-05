class User < ActiveRecord::Base

  has_secure_password

  validates_uniqueness_of :email, case_sensitive: false
  validates :name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 8 }

  def new
    redirect_to '/'
  end

end
