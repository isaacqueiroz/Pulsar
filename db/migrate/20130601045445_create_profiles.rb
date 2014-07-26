class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :surname
      t.string :address1
      t.string :address2
      t.string :phone
      t.date :birthdate
      t.date :signdate
      t.references :user, index: true

      t.timestamps
    end
  end
end

