class CreateSpains < ActiveRecord::Migration
  def self.up
    create_table :spains do |t|
      t.text :news
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :spains
  end
end
