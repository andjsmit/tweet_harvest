class CreateDataSets < ActiveRecord::Migration[5.1]
  def change
    create_table :data_sets do |t|
      t.string :name
      t.text :description
      t.string :source
      t.string :filename

      t.timestamps
    end

    create_table :tweets_data_sets, id: false do |t|
      t.belongs_to :tweet, index: true
      t.belongs_to :data_set, index: true
    end
    
  end
end
