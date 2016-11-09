class CreatePosts < ActiveRecord::Migration[5.0]
  def up
    create_table :posts do |t|
    	t.string :title, null: false
    	t.text	 :content, null: false
    	t.decimal :latitude, precision: 10, scale: 6, null: false
    	t.decimal :longitude, precision: 10, scale: 6, null: false
    	t.decimal :altitude, precision: 10, scale: 6
    	t.decimal :accuracy
    	t.decimal :altitude_accuracy
    	t.datetime :deleted_at
    	t.datetime :expire_at
    	t.datetime :expired
    	t.integer :deleted_by

    	t.timestamps
    end

    add_reference :posts, :user, index: true, foreign_key: true
    add_index :posts, :latitude
    add_index :posts, :longitude
  end

  def down
  	drop_table :posts
  end
end
