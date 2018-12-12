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
    @payment.payee = current_user
    if @family.parent == current_user
      @family.outstanding_parent_balance = @family.outstanding_parent_balance.to_i - @payment.amount.to_i
      @family.outstanding_coparent_balance = @family.outstanding_coparent_balance + @payment.amount.to_i
      @family.save
    elsif @family.coparent == current_user
      @family.outstanding_parent_balance = @family.outstanding_parent_balance.to_i + @payment.amount.to_i
      @family.outstanding_coparent_balance = @family.outstanding_coparent_balance - @payment.amount.to_i
      @family.save
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :payment_method)
  end

  def find_family
    @family = Family.find(params[:family_id])
  end
end
