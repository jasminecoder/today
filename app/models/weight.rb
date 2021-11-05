class Weight < ApplicationRecord
  validates :weight, :weighed_on, presence: true
  belongs_to :user
end
