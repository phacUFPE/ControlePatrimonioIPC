class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :validatable

  def admin_text
    if self[:admin]
      self[:admin] = "Yes"
    else
      self[:admin] = "No"
    end
  end
end
