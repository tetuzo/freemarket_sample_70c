class AddBirthdayDayToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthday_day, :integer
  end
end
