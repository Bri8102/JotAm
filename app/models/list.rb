class List < ApplicationRecord
    has_many :users
    has_many :tasks, :dependent => :destroy
    # accepts_nested_attributes_for :tasks

    validates :title, presence: true
    validates :description, presence: true, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
end
