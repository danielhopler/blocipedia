class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Blocipedia Premium Membership  - #{current_user.username}",
      amount: 15_00
    }
  end

  def create


    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 15_00,
      description: "Blocipedia Premium Membership - #{current_user.email}",
      currency: 'usd'
    )

    flash[:notice] = "Thank you for your payment, #{current_user.email}! You are now a #{current_user.role} member!"
    redirect_to edit_user_registration_path

    current_user.update_attribute(:role, 'premium')
    
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end



end
