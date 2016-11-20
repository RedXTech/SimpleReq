require 'rest-client'
require 'json'
require 'hpricot'

class SimpleReq
  def self.get(url, get={})
    if get.empty?
      return RestClient.get(url)
    else
      args = '?'
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

  def self.get_el(url, el, get={})
    if get.empty?
      req = get(url).body
      doc = Hpricot(req)
      return (doc/el)
    else
      args = '?'
      first = true
      get.each {|p, v|
        args << '&' unless first
        args << "#{p}=#{v}"
        first = false
      }
      req = get(url, $args).body
      doc = Hpricot(req)
      return (doc/el)
    end
  end
  def self.post_el(url, el, post)
    req = post(url, post).body
    doc = Hpricot(req)
    return (doc/el)
  end
end