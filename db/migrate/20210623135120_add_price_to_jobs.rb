class AddPriceToJobs < ActiveRecord::Migration[6.0]
  def change
    add_monetize :jobs, :price, currency: { present: false }
  end
end
