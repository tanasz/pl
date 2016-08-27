class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.datetime :date_time
      t.time :duration
      t.string :theme
      t.string :location

      t.timestamps
    end
  end
end
