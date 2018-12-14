class PaymentsController < ApplicationController
  before_action :find_family, only: [:index, :new, :create, :stripe]

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

  def pay

  end

  def stripe
    amount =  params[:payment][:balance]
    @payment = Payment.new
    @payment.amount = amount.to_i/100
    @payment.family = @family
    @payment.payer = current_user
    if @family.parent == current_user
      @family.save
      @payment.payee = @family.coparent
    elsif @family.coparent == current_user
      @family.save
      @payment.payee = @family.parent
    end
    @payment.save
    redirect_to family_payments_path(@family)

    #   customer = Stripe::Customer.create(
    #     source: params[:stripeToken],
    #     email:  params[:stripeEmail]
    #   )

    #   charge = Stripe::Charge.create(
    #     customer:     customer.id,   # You should store this customer id and re-use it.
    #     amount:       amount,
    #     description:  "Pay coparent",
    #     currency:    payment.amount.currency
    #   )

    # rescue Stripe::CardError => e
    #   flash[:alert] = e.message
    #   redirect_to new_order_payment_path(@order)
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :payment_method)
  end

  def find_family
    @family = Family.find(params[:family_id])
  end
end
