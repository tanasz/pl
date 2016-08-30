class ChangeNameOfTypeColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :memberships, :type, :membership_type
  end
end
