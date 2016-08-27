class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :date_of_birth, :date
    add_column :users, :birthplace_city, :string
    add_column :users, :birthplace_postcode, :string
    add_column :users, :birthplace_country, :string
    add_column :users, :is_board_member, :boolean
    add_column :users, :is_teacher, :boolean
    add_column :users, :mobile_phone, :string
    add_column :users, :emergency_contact_name, :string
    add_column :users, :emergency_contact_phone, :string
    add_column :users, :emergency_contact_relationship, :string
    add_column :users, :photo, :string
  end
end
