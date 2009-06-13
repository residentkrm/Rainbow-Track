class CreateHashValues < ActiveRecord::Migration
  def self.up
    create_table :hash_values do |t|
		t.column :hash_value, :string
		t.column :plaintext, :string
		t.column :hash_type_id, :integer
		t.column :hash_status_id, :integer
		t.column :session_id, :integer
    end
  end

  def self.down
    drop_table :hash_values
  end
end
