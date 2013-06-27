class CreateMemes < ActiveRecord::Migration
  def change
    drop_table :memes
    create_table :memes do |t|
      t.string :title
      t.string :top_text
      t.string :bottom_text
      t.string :url

      t.timestamps
    end
  end
end
