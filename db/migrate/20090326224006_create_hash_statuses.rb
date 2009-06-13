class CreateHashStatuses < ActiveRecord::Migration
  def self.up
    create_table :hash_statuses do |t|
		t.column :name, :string
    end

	 HashStatus.new(:name => "New").save
	 HashStatus.new(:name => "Cracking").save
	 HashStatus.new(:name => "Cracked").save
	
  end

  def self.down
    drop_table :hash_statuses
  end
end
