# frozen_string_literal: true

if defined?(::Rails::Server)
  UpdatePaymentRequestService.new.subscribe_to_queue
end
