class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.text :about
      t.text :visa_box
      t.string :slug
      t.string :video
      t.string :country_code
      t.boolean :selective

      t.timestamps null: false
    end

    add_index :countries, :slug, unique: true
  end
end
