class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.string :period
      t.string :type
      t.float :fee
      t.boolean :fee_is_paid
      t.boolean :application_ok
      t.boolean :medical_certificate_ok
      t.text :commentary
      t.string :status
      t.string :license_number
      t.string :club_number

      t.timestamps
    end
  end
end
