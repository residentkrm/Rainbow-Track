class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
		t.column :session_status_id, :integer
		t.column :start, :datetime
		t.column :end, :datetime
		t.column :duration, :float
    end
  end

  def self.down
    drop_table :sessions
  end
end
