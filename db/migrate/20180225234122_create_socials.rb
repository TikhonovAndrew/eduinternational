class CreateSocials < ActiveRecord::Migration[5.1]
  def change
    create_table :socials do |t|
    	t.string :name
    	t.string :link

      t.timestamps
    end
     add_reference :socials, :branch, index: true, foreign_key: true
  end
 
end
