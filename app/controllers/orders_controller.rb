class OrdersController < ApplicationController
  def create
    plan = Plan.find(params[:plan_id])
    order = Order.create!(amount_cents: plan.price_cents, paid: false, user: current_user, plan: plan)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.where(paid: true).find(params[:id])
  end
end
