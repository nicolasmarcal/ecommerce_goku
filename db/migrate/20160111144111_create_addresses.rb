class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :zip_code
      t.string :street
      t.string :state
      t.string :city
      t.string :neighborhood

      t.timestamps null: false
    end
  end
end
