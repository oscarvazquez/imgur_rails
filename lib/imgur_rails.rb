require "imgur_rails/version"
require 'net/http'
require 'net/https'
require 'json'

module ImgurRails


	class Client

		attr_accessor :client_id, :headers
		attr_reader :url

		def initialize client_id
			@client_id = client_id
			@headers = { "Authorization" => "Client-ID #{client_id}"}
			@url = "https://api.imgur.com"
		end

		def get_tag tag
			path = "/3/gallery/t/#{tag}.json"
			uri = URI.parse(@url+path)
			request, data = Net::HTTP::Get.new(path, @headers)
			http = Net::HTTP.new(uri.host, uri.port)
			http.use_ssl = true
			response = http.request(request)
			puts response.body
			JSON.parse(response.body)
		end
		
		def get_tag_imgs tag imgId
			path = "/3/gallery/t/#{tag}/#{imgId}.json"
			uri = URI.parse("https://api.imgur.com"+path)
			request, data = Net::HTTP::Get.new(path, @headers)
			http = Net::HTTP.new(uri.host, uri.port)
			http.use_ssl = true
			response = http.request(request)
			puts response.body
			JSON.parse(response.body)
		end

	end
end
