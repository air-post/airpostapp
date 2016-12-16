class ChangeUserTypeToInt < ActiveRecord::Migration[5.0]
  def self.up
    change_column :users, :user_type, 'integer USING (user_type::integer)'
  end
 
  def self.down
    change_column :users, :user_type, 'string USING (user_type::string)'
  end
end
