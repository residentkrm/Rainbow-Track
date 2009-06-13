class CreateHashValuesUsers < ActiveRecord::Migration
  def self.up
    create_table :hash_values_users, :id => false do |t|
		t.column :hash_value_id, :integer
		t.column :user_id, :integer
    end
  end

  def self.down
    drop_table :hash_values_users
  end
end
