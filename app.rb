require 'sinatra'  

set :bind, '0.0.0.0'
set :port, 8000 

outfile = 'out'

post '/out' do
   IO.readlines(outfile).last(10).join("")
end

#get '/hello' do     
#  'Hello, world!'   
#end 


post '/msg' do
  line = "ERROR"
  line = params["message"] 
  name = "NAME_ERROR"
  name = params["name"]
  message = "#{name}: #{line}\n" 
  open(outfile, 'a') do |f|   
    f.puts message
  end
  puts "/msg SENT DATA: #{message}"
  message 
end

get '/' do
  send_file 'index.html'
end

#before do   
#  expires 1, :public, :must_revalidate 
#end
#
before do   
  cache_control :no_cache   
  headers "Pragma"   => "no-cache", "Expires" => "0" 
end


