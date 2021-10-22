# frozen_string_literal: true

require 'bunny'

class UpdatePaymentRequestService
  def subscribe_to_queue
    BunnyClient.incoming_queue.subscribe do |_delivery_info, _metadata, message|
      update_payment_request(message)
    end
  end

  private

  def update_payment_request(message)
    parsed_msg = JSON.parse(message)

    payment_request = PaymentRequest.find(id: parsed_msg['external_payment_request_id'])
    payment_request.update(status: parsed_msg['status'])
  end
end
