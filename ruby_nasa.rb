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
def buid_web_page (hash)
    
    img =hash["photos"].collect do |i|
         i["img_src"]
            end
         html1 = 
        '<html>
        <head>
        </head>
        <body>
        <ul>'
    
    img.each do |img|
        html1 += "<li><img src=\"#{img}\"></li>\n"
    end

    html1 += '</ul>
             </body>
            </html>'

    File.write("index.html", html1)
end


buid_web_page (hash)