class ChangeColumnTypeOnWeights < ActiveRecord::Migration[6.1]
  def change
    change_column :weights, :weighed_on, :datetime
  end
end
