class Weight < ApplicationRecord
  validates :value, :weighed_on, presence: true
  belongs_to :user

  def weighed_today?
    weighed_on.today?
  end
end
