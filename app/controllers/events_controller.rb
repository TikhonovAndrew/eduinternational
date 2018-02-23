class EventsController < ApplicationController


  def index
    @events = Event.where('event_date_time >= ?', Date.today).order('event_date_time ASC')
  end

  def show
    @event = Event.friendly.find(params[:id])
    @events_kiev = Event.where('branch = ?', 'Kiev').all
    @event_confirmation = EventConfirmation.new
  end


end