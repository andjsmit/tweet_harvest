class CreateDataSets < ActiveRecord::Migration[5.1]
  def change
    create_table :data_sets do |t|
      t.string :name
      t.text :description
      t.string :source
      t.string :filename

      t.timestamps
    end
  end
end
