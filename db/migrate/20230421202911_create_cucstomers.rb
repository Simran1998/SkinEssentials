class CreateCucstomers < ActiveRecord::Migration[7.0]
  def change
    create_table :cucstomers do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :mobile_number
      t.string :address
      t.string :province
      t.string :postal_code

      t.timestamps
    end
  end
end
