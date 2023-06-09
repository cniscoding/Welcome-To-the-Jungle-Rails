class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_BASIC_USERNAME'], password: ENV['HTTP_BASIC_PASSWORD']

  def show
    @count_of_products = Product.count
    @count_of_categories = Category.count
  end
end
