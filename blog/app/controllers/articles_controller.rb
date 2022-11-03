class ArticlesController < ApplicationController
  def new
  end

  def create
    # this renders the parameters as a hash
    # render plain: params[:article].inspect
  end
end
