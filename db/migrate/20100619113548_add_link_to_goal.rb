class AddLinkToGoal < ActiveRecord::Migration
  def self.up
    add_column :goals, :link, :string
  end

  def self.down
    remove_column :goals, :link
  end
end
