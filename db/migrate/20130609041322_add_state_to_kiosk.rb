class AddStateToKiosk < ActiveRecord::Migration
  def change
    add_column :kiosks, :state, :string
  end
end
