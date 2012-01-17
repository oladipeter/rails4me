class CreateDescribes < ActiveRecord::Migration
  def self.up
    create_table :describes do |t|
      t.string :title
      t.string :short_description
      t.text :long_description
      t.string :keywords
      t.string :feedback
      t.string :gitlink

      t.timestamps
    end
  end

  def self.down
    drop_table :describes
  end
end
