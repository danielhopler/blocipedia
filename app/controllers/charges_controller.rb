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
    current_user.update_attribute(:role, 'premium')
    flash[:notice] = "Thank you for your payment, #{current_user.email}! You are now a #{current_user.role} member!"
    redirect_to edit_user_registration_path

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def downgrade
    current_user.update_attribute(:role, 'standard')
    flash[:notice] = "You have successfully downgraded your account. Your wikis are now public."
    redirect_to edit_user_registration_path
  end


end
