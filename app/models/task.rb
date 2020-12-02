class Task < ApplicationRecord
  belongs_to :list
  has_many :users, through: :lists
  
  validates :task, presence: true
  
  def done?
    !done.blank?
  end
end
