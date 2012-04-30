class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :source
      t.integer :source_id

      t.timestamps
    end
  end
end
