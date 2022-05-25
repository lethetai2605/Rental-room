class StaticPagesController < ApplicationController
  def home
  end
  def search
    @rooms = Room.where('address LIKE ?', "%#{params[:location]}%")
    render 'searchresults'
  end
end
