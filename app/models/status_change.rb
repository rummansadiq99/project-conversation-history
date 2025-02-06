class StatusChange < ApplicationRecord
  belongs_to :user
  belongs_to :project
  
  validates :old_status, presence: true
  validates :new_status, presence: true
  
  def description
    "#{user.name} changed status from #{old_status} to #{new_status}"
  end
end
