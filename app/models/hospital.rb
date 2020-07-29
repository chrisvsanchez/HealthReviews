class Hospital < ApplicationRecord
  belongs_to :location
  has_many :reviews
  has_many :users, through: :reviews

  def self.hospital_info
    #make a get request to api 
    response = RestClient.get("https://data.cityofnewyork.us/resource/833h-xwsx.json")
    
    data = JSON.parse(response)
    hospitals = data.select{|d|d["facility_name"].include?("Hospital")}

    hashed_hospitals = hospitals.map{|hos|
    {name: hos["facility_name"], address: JSON.parse(hos["location_1"]["human_address"]),speciality: hos["facility_type"]}}

    hashed_hospitals.each do |hos| 
      byebug
      final_address = (hos[:address]["address"] + " " + hos[:address]["city"]+ ", " +hos[:address]["state"] + ", " + hos[:address]["zip"])
  
      local_id = Location.create(state: hos[:address]["state"], city: hos[:address]["city"],zip: hos[:address]["zip"], healthsystem_id: nil)
      byebug
      # Hospital.hospital_info.create(name: hos[:name], :address final_address, :speciality hos[:speciality], :location_id local_id)
  
    end
Hospital.hospital_info 
end
end
