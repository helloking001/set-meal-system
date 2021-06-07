class CreateCutoffs < ActiveRecord::Migration[6.1]
  def change
    create_table :cutoffs do |t|
      t.datetime :time
      t.datetime :daylight_saving_begin
      t.datetime :daylight_saving_end
      t.timestamps
    end
  end
end
