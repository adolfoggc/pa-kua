class AddPaidFeeToPayment < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :paid_fee, :decimal
  end
end
