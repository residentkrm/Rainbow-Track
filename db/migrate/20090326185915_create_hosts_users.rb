class CreateHostsUsers < ActiveRecord::Migration
  def self.up
    create_table :hosts_users, :id => false do |t|
		t.column :host_id, :integer
		t.column :user_id, :integer
    end
  end

  def self.down
    drop_table :hosts_users
  end
end
