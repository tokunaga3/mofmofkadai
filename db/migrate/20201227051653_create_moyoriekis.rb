class CreateMoyoriekis < ActiveRecord::Migration[5.2]
  def change
    create_table :moyoriekis do |t|
      t.string :rosen
      t.string :station
      t.string :foot
      t.references :property, foreign_key: true
      t.timestamps
    end
  end
end
