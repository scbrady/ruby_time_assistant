class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.datetime :start
      t.datetime :end
      t.text :description
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
