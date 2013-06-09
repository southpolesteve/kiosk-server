class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.text :url
      t.integer :display_time
      t.integer :refresh_time
      t.integer :position
      t.references :kiosk

      t.timestamps
    end
    add_index :slides, :kiosk_id
  end
end
