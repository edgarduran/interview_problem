class User < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  validates :social_security_number, presence: true, uniqueness: true, length: { is: 9 }
  validates :email, presence: true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/,
    message: "Valid email format only" }

  def as_json(options = nil)
    super({only: [:first_name, :last_name, :email]})
  end
end
