class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.float :hourly
      t.float :price
      t.integer :status

      t.references :client, foreign_key: true
      t.timestamps
    end
  end
end
