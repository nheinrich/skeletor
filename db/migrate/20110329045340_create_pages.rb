class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.integer :project_id
      t.string :name
      t.text :markup
      t.text :styles
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
