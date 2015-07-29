class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :tags
      t.references :user, index: true, foreign_key: true
      t.string :summary
      t.text :description
      t.string :artwork

      t.timestamps null: false
    end
  end
end
