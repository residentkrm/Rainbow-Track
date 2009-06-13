class CreateSessionStatuses < ActiveRecord::Migration
  def self.up
    create_table :session_statuses do |t|
		t.column :name, :string
    end

	 SessionStatus.new(:name => 'Active').save
	 SessionStatus.new(:name => 'Completed').save
		
  end

  def self.down
    drop_table :session_statuses
  end
end
