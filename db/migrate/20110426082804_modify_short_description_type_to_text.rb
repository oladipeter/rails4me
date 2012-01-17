class ModifyShortDescriptionTypeToText < ActiveRecord::Migration
  def self.up
    change_column :describes, :short_description, :text
  end

  def self.down
  end
end
