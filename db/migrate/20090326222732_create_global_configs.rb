class CreateGlobalConfigs < ActiveRecord::Migration
  def self.up
    create_table :global_configs do |t|
		t.column :name, :string
		t.column :value, :string
 	 end
	
	 GlobalConfig.new(:name => 'MAX_SESSIONS', :value => '2').save
	 GlobalConfig.new(:name => 'RCRACK_PATH', :value => 'bin/rcrack').save
	 GlobalConfig.new(:name => 'RCRACK_TMP_PATH', :value => '/tmp').save
	 GlobalConfig.new(:name => 'RCRACK_TABLE_PATH', :value => 'tables/lm_alpha').save
			
  end

  def self.down
    drop_table :global_configs
  end
end
