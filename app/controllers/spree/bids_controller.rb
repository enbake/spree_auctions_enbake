class Spree::BidsController < Spree::StoreController

  def create
    @prodval= JSON.parse params[:products]
    variant_id = @prodval.first[1].to_i
    product_id = @prodval.first[0].to_i
    @product = Spree::Product.find product_id
    if @product.status == 'closed'
      flash[:error]= Spree.t(:auction_sold)
      redirect_to product_path @product
      return
    end
    unless spree_current_user
      session['bid'] = Spree::Bid.new(:price => params[:bid_price], :variant_id =>  variant_id ,:product_id => product_id )
      redirect_to spree.login_path
      return
    end
    @bid = Spree::Bid.find_or_initialize_by_variant_id_and_user_id_and_product_id(variant_id, spree_current_user.id,product_id)
    @bid.price = params[:bid_price]

    if @bid.save
      BeddingMailer.bedding_mail(spree_current_user, @bid).deliver
      BeddingMailer.outbid_mail(@bid).deliver
      respond_to do |format|
        flash[:success] = Spree.t(:bid_place)
        format.html {redirect_to(:back)}
      end
    else
      flash[:error] = Spree.t(:bid_place_error)
      redirect_to :back
    end
  end

  # winner link click
  # checkout flow
  #################### ------------- after winnder pays
  # update product.status = closed
  # update product order_id and confirmation_date


end
