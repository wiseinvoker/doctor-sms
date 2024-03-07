# app/models/notification.rb
class Notification < ApplicationRecord
  belongs_to :trigger
end
  