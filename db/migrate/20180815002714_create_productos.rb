class CreateProductos < ActiveRecord::Migration[5.2]
  def change
    create_table :productos do |t|
      t.string :codigo
      t.string :descripcion
      t.string :unidad
      t.integer :impuesto
      t.integer :precio

      t.timestamps
    end
  end
end
