class CreateMemes < ActiveRecord::Migration
  def change
    create_table :memes do |t|
      t.string :title
      t.string :top_text
      t.string :bottom_text
      t.string :urL

      t.timestamps
    end
  end
end
