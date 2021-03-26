require "uri"
require "net/http"
require "json"

def request (url, key)
    url = URI(url + key)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    return JSON.parse (response.read_body)
end


hash = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=","vHz2dBH3vhuJg4dherN6dVSogYJOV0uGJPugQ8Xe")
