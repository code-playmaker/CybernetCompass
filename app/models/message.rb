class Message < ApplicationRecord
  belongs_to :user
  validates :title, :content, :importancy, :emergency, presence: true
  enum importancy:{
    高:1,中:2,低:3
  }, _prefix: :importancy
  enum emergency:{
    高:1,中:2,低:3
  }, _prefix: :emergency
end