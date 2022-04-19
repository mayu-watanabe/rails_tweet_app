class HomeController < ApplicationController
  before_action :check_is_logined, {only: [:top]}

  def top
  end

  def about
  end
end
