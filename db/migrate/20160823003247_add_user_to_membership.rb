class AddUserToMembership < ActiveRecord::Migration[5.0]
  def change
    add_reference :memberships, :user, foreign_key: true
  end
end
