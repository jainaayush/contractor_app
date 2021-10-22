# frozen_string_literal: true

class PaymentRequestsController < ApplicationController
  # GET /payment_requests
  def index
    @payment_requests = PaymentRequest.all
  end

  # GET /payment_requests/new
  def new
    @payment_request = PaymentRequest.new
  end

  # POST /payment_requests
  def create
    @payment_request = PaymentRequest.new(payment_request_params)

    if @payment_request.save
      ExportPaymentRequestService.new(@payment_request.id).publish
      redirect_to payment_requests_path, notice: 'Payment request was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def payment_request_params
    params.require(:payment_request).permit(:amount, :currency, :description, :status)
  end
end
