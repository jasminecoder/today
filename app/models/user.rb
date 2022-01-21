class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  before_save { self.name = name.titlecase }
  has_many :weights, -> { order(weighed_on: :desc, created_at: :desc) }

  def weight_value(i)
    saved_weights[i].value if i <= saved_weights.size - 1
  end     

  def weight_change(i)
    (saved_weights[i].value.to_f - saved_weights[i + 1].value.to_f).round(2) if i < saved_weights.size - 1
  end     

  def saved_weights
    weights.select(&:persisted?)
  end

  def weighed_today?
    saved_weights.any?(&:weighed_today?)
  end

  def chart_weights
    saved_weights.map do |weight|
      [weight.weighed_on.strftime('%m/%d/%Y'), weight.value]
    end
    
end
end
