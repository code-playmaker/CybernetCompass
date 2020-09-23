class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :assignment, optional: true
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :number, presence: true, uniqueness: true
  validates :password, confirmation: true

  def email_required?
    false
  end

  def email_changed?
    false
  end

end