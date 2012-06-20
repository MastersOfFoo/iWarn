class Event < ActiveResource::Base
  self.site = "http://iwarn-staging.herokuapp.com"

  def photos(scope = :all)
    Photo.find(scope, :params => {:event_id => self.id})
  end

  def event_logs(scope = :all)
    EventLog.find(scope, :params => {:event_id => self.id})
  end

  def people(scope = :all)
    Person.find(scope, :params => {:event_id => self.id})
  end

  def vehicles(scope = :all)
    Vehicle.find(scope, :params => {:event_id => self.id})
  end
end
