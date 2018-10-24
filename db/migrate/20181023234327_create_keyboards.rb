class CreateKeyboards < ActiveRecord::Migration[5.2]
  def change
    create_table :keyboards do |t|
      t.string :name
      t.string :layout
      t.string :switch

      t.timestamps
    end
  end
end
