require "faraday"
require "json"

conn = Faraday.new(:url => 'http://localhost:3000') do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  faraday.response :logger                  # log requests to STDOUT
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end

## GET ##

# response = conn.get '/api/v1/campaigns'
# puts response.body

# response = conn.post "/api/v1/campaigns" do |req|
#               req.params["campaigns[title]"] = "Hello World"
#            end
# puts response.body

print "Give me the campaign title: "
title = gets.chomp

print "Give me the campaign's description: "
description = gets.chomp

print "Give me the campaign's goal: "
goal = gets.chomp

response = conn.post "/api/v1/campaigns", {campaign: {title:       title,
                                                      description: description,
                                                      goal:        goal}}
# response will be a valid ruby object (Hash / Array / String)
response = JSON.parse(response.body)

puts response["success"]
puts response["errors"]
