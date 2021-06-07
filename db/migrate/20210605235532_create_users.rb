class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :empoid
      t.string :password_digest, :length => 72
      t.timestamps
    end
  end
end
