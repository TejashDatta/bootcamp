class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts do |t|
      t.decimal :balance, precision: 19, scale: 4
      t.string :currency

      t.timestamps
    end
  end
end
