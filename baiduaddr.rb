#!/usr/bin/ruby
#*============================================================================*
#File:		../com/baiduaddr.rb
#Version:	1.0
#Author:	lijiashu <broadskyer@gmail.com>
#			Copyright (c) lijiashu @BUPT
#Date:		Wed 17 Apr 2013 07:02:33 PM CST
#Brief:		
#Description: 
#*******************************************************************************
#history:
#*============================================================================*/

require 'httparty'
class Baiduaddr
	#--------------------------------------------------------------------------#
	#*INPUT:
	#*OUTPUT:
	#*FUNCTION:
	#--------------------------------------------------------------------------#
    def initialize(baidu_key)
        @baidu_key = baidu_key
        @body = ""
    end
	#--------------------------------------------------------------------------#
	#*INPUT:
	#*OUTPUT:
	#*FUNCTION:
	#--------------------------------------------------------------------------#
    def get(lat, lng)
        location = "#{lat},#{lng}"
        @body = HTTParty.get("http://api.map.baidu.com/geocoder?location=#{location}&key=#{@baidu_key}")['GeocoderSearchResponse']['result'] if @body == ""      #singleton
#        @body = @body['result']
        @body = "" if @body == nil
        puts @body
        return self 
    end
	#--------------------------------------------------------------------------#
	#*INPUT:
	#*OUTPUT:
	#*FUNCTION:
	#--------------------------------------------------------------------------#
    def address()
        return @body['formatted_address'] if @body['formatted_address'] != nil
        return ""
    end
	#--------------------------------------------------------------------------#
	#*INPUT:
	#*OUTPUT:
	#*FUNCTION:
	#--------------------------------------------------------------------------#
    def business()
        return @body['business']  if @body['business'] != nil
        return ""
    end
	#--------------------------------------------------------------------------#
	#*INPUT:
	#*OUTPUT:
	#*FUNCTION:
	#--------------------------------------------------------------------------#
    def baidu_cid()
        return @body['cityCode'] if @body['cityCode'] != nil 
        return ""
    end
	#--------------------------------------------------------------------------#
	#*INPUT:
	#*OUTPUT:
	#*FUNCTION:
	#--------------------------------------------------------------------------#
    def street()
        return @body['addressComponent']['street'] if @body['addressComponent']['street'] != nil
        return ""
    end
end
