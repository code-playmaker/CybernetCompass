class Assignment < ApplicationRecord
  has_many :users
  validates :department, :division, :charge, presence: true
end
