class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :body
      t.datetime :posted_at
      t.timestamps
    end
  end
end
