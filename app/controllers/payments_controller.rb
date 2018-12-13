class PaymentsController < ApplicationController
  before_action :find_family, only: [:index, :new, :create]

  def index
    @payments = @family.payments
  end

  def new
    @payment = Payment.new
  end

  def create
    params[:payment][:payment_method] = params[:payment][:payment_method].to_i
    @payment = Payment.new(payment_params)
    @payment.family = @family
    @payment.payee = current_user
    if @family.parent == current_user
      @family.save
      @payment.payer = @family.coparent
    elsif @family.coparent == current_user
      @family.save
      @payment.payer = @family.parent
    end
    @payment.save
    redirect_to family_payments_path(@family)
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :payment_method)
  end

  def find_family
    @family = Family.find(params[:family_id])
  end
end
