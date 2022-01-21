class RenameWeightsWeightToValue < ActiveRecord::Migration[6.1]
  def change
    rename_column :weights, :weight, :value
  end
end
