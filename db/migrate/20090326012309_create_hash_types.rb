class CreateHashTypes < ActiveRecord::Migration
  def self.up
    create_table :hash_types do |t|
		t.column :name, :string
    end
  end

  def self.down
    drop_table :hash_types
  end
end
