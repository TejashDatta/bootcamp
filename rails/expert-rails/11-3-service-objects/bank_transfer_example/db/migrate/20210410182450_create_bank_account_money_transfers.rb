class CreateBankAccountMoneyTransfers < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_account_money_transfers do |t|
      t.bigint :from_id
      t.bigint :to_id
      t.decimal :amount, precision: 19, scale: 4
      t.string :currency

      t.timestamps
    end
  end
end
