# -*- encoding : utf-8 -*-
#!/usr/bin/env ruby

def require_local(suffix)
  require(File.expand_path(File.join(File.dirname(__FILE__), suffix)))
end

require 'rubygems'
require 'json'
require_local('../lib/top4r')

if __FILE__ == $0

  uri = URI('https://eco.taobao.com/router/rest')

  https = Net::HTTP.new(uri.host, 443)
  https.use_ssl = true
  https.verify_mode = OpenSSL::SSL::VERIFY_NONE

  https.start do |https|
    request = Net::HTTP::Get.new uri.request_uri
    response = https.request request
    puts response.body
  end

end
