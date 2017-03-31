class CreateFacts < ActiveRecord::Migration[5.0]
  def change
    create_table :facts do |t|
      t.string :api_id, null: false
      t.string :category
      t.string :url, null: false
      t.text :value, null: false

      t.timestamps
    end
  end
end
