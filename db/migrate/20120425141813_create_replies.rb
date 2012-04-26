class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :content
      t.integer :user_id
      t.integer :micropost_id

      t.timestamps
    end
		add_index :replies, :micropost_id
  end
end
