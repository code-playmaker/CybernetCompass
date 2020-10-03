class Notice < ApplicationRecord
  belongs_to :user
  validates :ntc_title, :ntc_content, :ntc_importancy, :ntc_emergency, presence: true
  enum importancy:{
    高:1,中:2,低:3
  }, _prefix: :ntc_importancy
  enum emergency:{
    高:1,中:2,低:3
  }, _prefix: :ntc_emergency
end
