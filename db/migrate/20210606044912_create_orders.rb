class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true, index: true
      t.references :set_meal, foreign_key: true, index: true
      t.boolean :has_finished, default: false
      t.timestamps
    end
  end
end
