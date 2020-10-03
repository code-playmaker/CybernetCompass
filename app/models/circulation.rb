class Circulation < ApplicationRecord
  belongs_to :user
  validates :cir_title, :cir_content, :cir_importancy, :cir_emergency, presence: true
  enum importancy:{
    高:1,中:2,低:3
  }, _prefix: :cir_importancy
  enum emergency:{
    高:1,中:2,低:3
  }, _prefix: :cir_emergency
end
