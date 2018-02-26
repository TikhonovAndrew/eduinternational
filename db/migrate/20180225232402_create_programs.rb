class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
    	t.string :name     

      t.timestamps
    end

    add_reference :programs, :school, index: true, foreign_key: true
  end
end
