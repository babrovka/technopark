class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.text :text
      t.integer :tag_id

      t.timestamps
    end
  end
end
