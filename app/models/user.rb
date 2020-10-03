class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :assignment, optional: true
  has_many :messages
  has_many :circulations
  has_many :notices
  validates :name, presence: true
  validates :number, presence: true, uniqueness: true
  validates :password, confirmation: true

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

end