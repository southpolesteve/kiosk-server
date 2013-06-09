class CreateKiosks < ActiveRecord::Migration
  def change
    create_table :kiosks do |t|
      t.text :config
      t.string :cpu_id

      t.timestamps
    end
  end
end
