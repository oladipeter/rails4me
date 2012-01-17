class AddPublicColumnToDescribes < ActiveRecord::Migration
  def self.up
    add_column :describes, :public, :boolean, :default => false
  end

  def self.down
    remove_column :describes, :public
  end
end
