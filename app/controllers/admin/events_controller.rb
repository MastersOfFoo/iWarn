module Admin
  class EventsController < ApplicationController
    http_basic_authenticate_with :name => "admin", :password => "default"

    def index
      @events = Event.all
    end
    
    def destroy
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to admin_events_path, :notice => "Event was successfully destroyed!"
    end

  end
end
