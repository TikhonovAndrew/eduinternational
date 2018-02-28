class EventsController < ApplicationController


  def index
    @events = Event.where('event_date_time >= ?', Date.today).order('event_date_time ASC')
  end

  def show
    @events = Event.all
    @posts = Post.all
    @branches = Branch.all
  end


end