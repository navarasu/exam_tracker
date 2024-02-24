class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :recoverable, :rememberable, :validatable, :database_authenticatable, authentication_keys: [:username]
  enum role: %w[staff admin]

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
