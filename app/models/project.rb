class Project < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :status_changes, dependent: :destroy
  
  VALID_STATUSES = ['Not Started', 'In Progress', 'On Hold', 'Completed'].freeze
  DEFAULT_STATUS = 'Not Started'
  
  validates :name, presence: true
  validates :status, presence: true, inclusion: { in: VALID_STATUSES }
  
  before_validation :set_default_status, on: :create
  
  def conversation_items
    (comments + status_changes).sort_by(&:created_at).reverse
  end
  
  private
  
  def set_default_status
    self.status ||= DEFAULT_STATUS
  end
end
