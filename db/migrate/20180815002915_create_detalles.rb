class CreateDetalles < ActiveRecord::Migration[5.2]
  def change
    create_table :detalles do |t|
      t.string :nofra
      t.string :codigoprd
      t.integer :cantidad
      t.integer :impuesto
      t.integer :precio

      t.timestamps
    end
  end
end
