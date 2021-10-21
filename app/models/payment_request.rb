class PaymentRequest < ApplicationRecord
  enum status: [:pending, :approved, :rejected]
end
