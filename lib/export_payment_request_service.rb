# frozen_string_literal: true

require 'bunny'

class ExportPaymentRequestService
  attr_reader :payment_request

  def initialize(payment_request_id)
    @payment_request = PaymentRequest.find_by id: payment_request_id
  end

  def publish
    return if payment_request.nil?

    exchange = BunnyClient.channel.exchange('')
    exchange.publish(payload, routing_key: BunnyClient.sending_queue.name, persistent: true)
  end

  private

  def payload
    payment_request.to_json
  end
end
