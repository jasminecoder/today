class CreateWeights < ActiveRecord::Migration[6.1]
  def change
    create_table :weights do |t|
      t.float :weight
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
