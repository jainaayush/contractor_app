# frozen_string_literal: true

class PaymentRequest < ApplicationRecord
  enum status: %i[pending approved rejected]
end
