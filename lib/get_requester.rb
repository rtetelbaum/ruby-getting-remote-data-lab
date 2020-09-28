require 'json'
require 'uri'
require 'net/http'
require 'net/https'

class GetRequester
	attr_accessor :json_link
	@@all = []

	def initialize(json_link)
		@json_link = json_link
		@@all << self
	end

	def self.all
		@@all
	end

	def get_response_body
		uri = URI.parse(self.json_link)
    response = Net::HTTP.get_response(uri)
    response.body
	end

	def parse_json
		parsed = JSON.parse(self.get_response_body)
	end
end

json_link = "https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json"

people = GetRequester.new(json_link)

puts people.parse_json