class AddCommentIdToDescribe < ActiveRecord::Migration
  def self.up
    add_column :describes, :comment_id, :integer
  end

  def self.down
    remove_column :describes, :comment_id
  end
end
