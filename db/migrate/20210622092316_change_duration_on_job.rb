class ChangeDurationOnJob < ActiveRecord::Migration[6.0]
  def change
    change_column :jobs, :duration, :string
  end
end
