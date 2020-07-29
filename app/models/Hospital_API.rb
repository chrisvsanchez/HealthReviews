require 'rest-client'
require 'json'
require 'pry'

class HospitalAPI < ApplicationRecord
    def self.hospital_info
        #make a get request to api 
        response = RestClient.get("https://data.cityofnewyork.us/resource/833h-xwsx.json")
        
        data = JSON.parse(response)
        hospitals = data.select{|d|d["facility_name"].include?("Hospital")}

        hashed_hospitals = hospitals.map{|h|{name: h["facility_name"], address: h["location_1"]["human_address"],speciality: h["facility_type"]}}

        hashed_hospitals.each do |hos| 
            byebug
        end

    end
end

