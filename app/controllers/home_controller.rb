class HomeController < ApplicationController
  before_action :authenticate_reader!

  def index
    #@reader = Reader
  end

  def new
  end

  def create
  end
end
