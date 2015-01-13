namespace :auction do
  desc "TODO"
  task :select_winner => :environment do

    # product -> staus(bid(default), pending_confirmation, closed), winner_choose_date, confirmation_date, order_id
    #bid => status (rejected, pending_confirmation, bid(default))

    # products.expired && status => bid
    # for each product
        # get highest bid where status <> rejected Spree::Bid.select("max(price) as price, variant_id").group("variant_id")    ,
        # if no bid, product.status = closed
        # update product => pending_confirmation, winnder choose_date => today
        # update bid => pending_confirmation
        #send mail to winning bid



    # winner link click
      # verify product status != closed and bid for this product_id === user_id, bid.status => pending confirmation
    # checkout flow
      #################### ------------- after winnder pays
        # update product.status = closed
        # update product order_id and confirmation_date



    #3 days task:
    # products.expired && status => pending_confirmation && winnder choose_date > 3 days
          # for each product,
              # { update bids with status pending_confirmation  as rejected, #########--send mail }

              # get highest bid where status <> rejected,
              # if no bid, product.status = closed
              # update product => pending_confirmation, winnder choose_date => today
              # update bid => pending_confirmation
              #send mail to winning bid


                # product status not completed and expiring less than today
       products = Spree::Product.expiring_today
        products.each do |product|
          winning_bid = product.bids.where(:price=>product.bids.maximum(:price)).first
          if winning_bid.nil?
            product.status = 'closed'
            product.save
          else
        product.status = 'pending_confirmation'
        product.winner_choose_date = Date.today
        product.save

        winning_bid.status = 'pending_confirmation'
        winning_bid.save

        BeddingMailer.winning_mail(winning_bid).deliver

        end
          # and winner_choose_date is null

          # if no winning bid, status => completed.

        end
    end


  desc "Reselect Winner"
  task :reselect_winner => :environment do
    products = Spree::Product.expired.where(:status=> 'pending_confirmation').where(:winner_choose_date == Date.today-3)
    products.each do |product|
      bid = product.bids.where(:status => 'pending_confirmation' ).first
      bid.status = 'rejected'
      bid.save
      winning_bid = product.bids.where(:status=> 'bid').where(:price=>product.bids.maximum(:price)).first
      if winning_bid.nil?
        product.status = 'closed'
        product.save
      else
        product.status = 'pending_confirmation'
        product.winner_choose_date = Date.today
        product.save

        winning_bid.status = 'pending_confirmation'
        winning_bid.save

        BeddingMailer.winning_mail(winning_bid).deliver
        BeddingMailer.looser_mail(winning_bid).deliver
      end

    end
  end

  desc "checkout mail to  Winner"
  task :winner_mail => :environment do
    product = Spree::Product.last
      bid = product.bids.where(:price => product.bids.maximum(:price)).first
      product.status = 'pending_confirmation'
      product.winner_choose_date = Date.today
      product.save

      unless bid.nil?
      bid.status ='pending_confirmation'
      bid.save
      BeddingMailer.winning_mail(bid).deliver
      BeddingMailer.looser_mail(bid).deliver
      end
    end


end