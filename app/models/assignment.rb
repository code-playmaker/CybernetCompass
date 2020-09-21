class Assignment < ApplicationRecord
  has_many :users, optional: true
  validates :department, :division, :charge, presence: true
end
