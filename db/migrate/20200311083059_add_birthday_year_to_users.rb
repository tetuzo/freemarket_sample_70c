class AddBirthdayYearToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthday_year, :integer
  end
end
