class CreateBoots < ActiveRecord::Migration
  def self.up
    create_table :boots do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :boots
  end
end
