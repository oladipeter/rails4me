class AddProjectIdToDescribe < ActiveRecord::Migration
  def self.up
    add_column :describes, :project_id, :integer
  end

  def self.down
    remove_column :describes, :project_id
  end
end
