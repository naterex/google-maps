class Place < ActiveRecord::Base

  # Geocoding the latitude/longitude

  # When we create the new venue, we don't know the latitude and longitude. Thus, we want to provide the address,
  # and use some 3rd party service to convert it to lat/lng

  reverse_geocoded_by :lat, :lng
  after_validation :reverse_geocode  # auto-fetch address
  geocoded_by :address, :latitude  => :lat, :longitude => :lng   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
end
