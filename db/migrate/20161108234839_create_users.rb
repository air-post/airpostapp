class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.datetime :disabled_at

      t.timestamps
    end

    execute <<-SQL
      INSERT into users
        (name, email, password, disabled_at, created_at, updated_at)
        values ("system", "system@airpost.com", "111111", null, datetime(), datetime());
    SQL
  end

  def down
  	drop_table :users
  end
end
