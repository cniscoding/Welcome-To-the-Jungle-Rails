class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: 'username', password: 'password'

  def show
    @count_of_products = Product.count
    @count_of_categories = Category.count
  end
end
