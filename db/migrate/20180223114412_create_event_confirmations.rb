class CreateEventConfirmations < ActiveRecord::Migration[5.1]
  def change
    create_table :event_confirmations do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :phone
      t.references :event, index: true, foreign_key: true

      t.timestamps
    end
  end
end
