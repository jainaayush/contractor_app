# frozen_string_literal: true

# BunnyClient module
module BunnyClient
  def self.connection
    @connection ||= begin
      conn = Bunny.new(
        'amqps://fbnqhbyt:TO0DC8a6btYhiI02c0yRkU6wlRdiTq6G@puffin.rmq2.cloudamqp.com/fbnqhbyt', automatically_recover: false
      )
      conn.start
    end
  end

  def self.channel
    @channel ||= connection.create_channel
  end

  def self.incoming_queue
    @incoming_queue ||= channel.queue('pr-with-updated-status', durable: true)
  end

  def self.sending_queue
    @sending_queue ||= channel.queue('pr-with-initial-status', durable: true)
  end
end
