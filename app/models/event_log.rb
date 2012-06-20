class EventLog < ActiveResource::Base
  self.site = "http://iwarn-staging.herokuapp.com/events/:event_id"
end
