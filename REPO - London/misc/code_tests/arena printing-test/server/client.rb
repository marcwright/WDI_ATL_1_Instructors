require 'rubygems'
require 'net/http'
require 'active_support/all'
require 'builder'

class CardPrinter
  attr_accessor :server_address
  attr_accessor :output_folder

  def go
    orders_request = response_for_path("orders")

    if orders_request["order_ids"]
      orders_request["order_ids"].each do |order_id| 
        puts "# getting #{order_id}"
        create_order_xml_file("#{order_id}.xml", response_for_path("order/#{order_id}"))
        response_for_path("order/completed/#{order_id}")
      end
    end

  end
  
  private
  def create_order_xml_file(filename, hash)
    File.open(File.join(output_folder, filename), "w") do |f|     
      f.write(order_xml(hash))
    end
  end
  
  private
  def order_xml(hash)
    xml = Builder::XmlMarkup.new( :indent => 2 )
    xml.instruct! :xml, :encoding => "ASCII"
    xml.order do |order|
      hash.keys.each do |key|
        order.__send__(key, hash[key])
      end
    end
  end
  
  private
  def server_request(*path)
    full_path = File.join(path.flatten.unshift(server_address))
    url = URI.parse(full_path)
    request = Net::HTTP::Get.new(url.path)
    result = Net::HTTP.start(url.host, url.port) {|http|
      http.request(request)
    }
  end

  private
  def response_for_path(*path)
    ActiveSupport::JSON.decode(server_request(path).body)
  end

end

cp = CardPrinter.new
cp.server_address = "http://localhost:4567"
cp.output_folder = "out"
cp.go

