# frozen_string_literal: true

require 'bunny'

class PaymentRequestService
  attr_reader :payment_request

  def initialize(payment_request_id)
    @payment_request = PaymentRequest.find_by id: payment_request_id
  end

  def publish
    return if payment_request.nil?

    exchange = channel.exchange('')
    exchange.publish(payload, routing_key: queue.name, persistent: true)
    connection.close
  end

  private

  def payload
    payment_request.to_json
  end

  def connection
    @connection ||= begin
                conn = Bunny.new("amqps://fbnqhbyt:TO0DC8a6btYhiI02c0yRkU6wlRdiTq6G@puffin.rmq2.cloudamqp.com/fbnqhbyt", automatically_recover: false)
                conn.start
              end
  end

  def channel
    @channel ||= connection.create_channel
  end

  def queue
    @queue ||= channel.queue("payment-requests", durable: true)
  end
end
