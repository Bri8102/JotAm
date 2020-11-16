class Task < ApplicationRecord
  belongs_to :list
  has_many :users, through: :lists
 

  def done?
    !done.blank?
  end
end
