# frozen_string_literal: true

class CreatePaymentRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_requests do |t|
      t.integer :amount, null: false
      t.string :currency, null: false
      t.string :description, null: false
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
