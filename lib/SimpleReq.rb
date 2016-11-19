require 'rest-client'
require 'json'
require 'hpricot'

class SimpleReq
  def self.get(url, get={})
    if get.empty?
      return RestClient.get(url)
    else
      args = "?"
      first = true
      get.each {|p, v|
        args << '&' unless first
        args << "#{p}=#{v}"
        first = false
      }
      return RestClient.get("#{url}#{args}")
    end
  end
  def self.post(url, post)
    return RestClient.post(url, post)
  end
  def self.j_get(url, get={})
    if get.empty?
      return JSON.parse(get(url).body)
    else
      return JSON.parse(get(url, get).body)
    end
  end
  def self.j_post(url, post)
    JSON.parse(post(url, post).body)
  end
end