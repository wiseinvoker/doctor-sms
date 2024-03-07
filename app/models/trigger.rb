# app/models/trigger.rb
class Trigger < ApplicationRecord
    has_many :notifications, dependent: :destroy
end
  