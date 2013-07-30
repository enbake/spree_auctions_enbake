SpreeAuctions
=============

Introduction goes here.

Spree_auctions is the extension of the spree gem. It will create a Action House in which admin add the number of Products and users place their bid to the Products and admin will accept/reject the bid. 

Installation
------------

Add spree_auctions to your Gemfile:

```ruby
gem 'spree_auctions', github: 'enbake/spree_auctions_enbake'	
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_auctions:install
```

Usage:
-----
Following are the steps to create product, place a bid and accept/reject the order:

Steps to create a Product:
 
  1. Login as Admin:
  2. Open the page '/admin' which display the admin panel.
  3. Select 'PRODUCTS' tab then click 'NEW PRODUCT'.
  4. Enter Product name, its master price and availability date.
  5. Then click 'CREATE' button to create a Product.
  6. Your product is created, now you will edit and add more properties of your product.
  7. Add Product description.Select taxons, option types,etc.
  8. With the help of taxons you will categorizing your products.And option types denote the different options for variants like size, color of product,etc.
  9. Click on update button to update details of product.
  10. To select image for the product, click on 'IMAGES' link at right side of the window.
  11. Click 'New image' button → Choose File → Click 'UPDATE' button.
  12. To select differents variants for the product.Click 'VARIANTS' link at right side of window.
  13. Click 'NEW VARIANT' → Enter Bid Price for your product and select options for your product → Click 'CREATE' button.
  14. You will add multiple variants for a Product.
  15. The Bid is for different variants of the product so that variants for the product are must to place a bid.

Steps to Place a Bid:

  1. Login as a user.
  2. You will show the home page.There are two categories: Latest and Featured.You can select any product from any categories. On click 'SHOP' at top of the screen,it shows all the products.
  3. Select the Product on which you want to place a bid.
  4. Select the variant of the product.
  5. Enter your bid price.It must be greater than the minimum bid price.Otherwise an alert message is display.
  6. Select the number of variants for the product, by default is 1 → Click on 'Place Bid' button.
  7. If you want to continue shopping click 'Continue shopping' button, else click 'Checkout' button.
  8. Enter your shipping address → click 'Save and Continue' button.
  9. Click on 'Place Bid' button to place your bid successfully.
  10. A flash message is display ie. Your bid has been added to the system and an email is send to the user.

Steps to Accept/Reject the Bid:

  1. Login as a admin.
  2. Open the page '/admin' which display the list of all the bids.
  3. Click on envelope like icon button in front of the bid you want to accept/reject.
  4. A new page is open with two options 'Accept' and 'Reject'.
  5. If you want to accpet the bid, select 'Accept' and click 'Proceed' button. A confirmation mail is send to the user whose bid is accepted.
  6. If you want to reject the bid, select 'Reject' and click 'Proceed' button. Then selected bid is cancelled. 

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_auctions/factories'
```

Copyright (c) 2013 [name of extension creator], released under the New BSD License
