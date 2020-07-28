require 'rest-client'
require 'json'
require 'pry'
    def hospital_info
    #make a get request to api 
    response = RestClient.get("https://data.cityofnewyork.us/resource/833h-xwsx.json")
    
    data = JSON.parse(response)
    binding.pry
    end
    hospital_info