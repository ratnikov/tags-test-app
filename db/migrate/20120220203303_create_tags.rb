class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end

    create_table :taggables do |t|
      t.belongs_to :tag
      t.belongs_to :parent, :polymorphic => true

      t.timestamps
    end
  end
end
