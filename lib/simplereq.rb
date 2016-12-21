require 'rest-client'
require 'json'
require 'nokogiri'
require 'uri'

class SimpleReq
  def self.get(url, get={})
    if get.empty?
      url = URI.encode(url)
      return RestClient.get(url)
    else
      args = '?'
      first = true
      get.each {|p, v|
        args << '&' unless first
        args << "#{p}=#{v}"
        first = false
      }
      url = URI.encode("#{url}#{args}")
      return RestClient.get(url)
    end
  end
  def self.post(url, post)
    return RestClient.post(URI.encode(url), post)
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
  def self.get_el(url, el, get={})
    if get.empty?
      req = get(url).body
      doc = Nokogiri.HTML(req)
      element = doc.at_css(el)
      return element.content
    else
      args = '?'
      first = true
      get.each {|p, v|
        args << '&' unless first
        args << "#{p}=#{v}"
        first = false
      }
      req = get(url, get).body
      doc = Nokogiri.HTML(req)
      element = doc.at_css(el)
      return element.content
    end
  end
  def self.post_el(url, el, post)
    req = post(url, post).body
    doc = Nokogiri.HTML(req)
    element = doc.at_css(el)
    return element.content
  end
end