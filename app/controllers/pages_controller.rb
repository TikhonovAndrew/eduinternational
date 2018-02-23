class PagesController < ApplicationController
  def index
    @events = Event.where('branch = ?', 'Eduinternational').order('event_date_time ASC')
  end
end
