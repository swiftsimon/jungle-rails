class ReviewsController < ApplicationController

  def create
    @review = Review.new(category_params)
    @product = Product.find params[:product_id]
puts "#{current_user} USER"
    @review.user_id = current_user.id
    @review.product_id = params[:product_id]

    if @review.save
      puts "Did save"
      redirect_to product_path(params[:product_id], notice: 'Thanks for your review')
    else
      puts "No save"
      redirect_to product_path(params[:product_id], notice: 'Sorry please submit review again')

    end



  end

  private

  def category_params
    params.require(:review).permit(
      :description,
      :rating,
    )
  end



end
