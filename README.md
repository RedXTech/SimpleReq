# SimpleReq
[![Gem Version](https://badge.fury.io/rb/simplereq.svg)](https://badge.fury.io/rb/simplereq)

SimpleReq is a simple requests library for Ruby.

By simple, I mean that you can get what you need done, without more complicated features such as headers, cookies, etc.

I apologize if you were looking for those features, but SimpleReq does not have them. I may consider adding them in the future. Maybe...

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simplereq'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simplereq

## Usage

Using SimpleReq can be as simple as:
 ```ruby
request = SimpleReq.get('https://redxtech.ca/test/simplereq/get')
request.body
# => "<!DOCTYPE HTML><html>...</html>"
request.code
# => 200
```

### Get
`SimpleReq.get()` returns an object that can be interacted with by `.body` and `.code`. `.body` returns a string of the HTML document, and `.code` returns a integer of the HTTP response code.

You can also pass a Hash to the get method
```ruby
SimpleReq.get('https://redxtech.ca/test/simplereq/get_args), {arg1: 'argument_one', arg2: 'argument_two'}`)
```
Which will instead get `https://redxtech.ca/test/simplereq/get_args?arg1=argument1&arg2=argument_two`

### Post
SimpleReq also supports `post`ing data to web pages as well.
```ruby
request = SimpleReq.post('https://redxtech.ca/test/simplereq/post', {arg1: 'argument_one', arg2: 'argument_two'})
```
This will return the same way as `SimpleReq.get`, except it will show the page as it would with the data `post`ed.

### Get Json
SimpleReq also has the ability to get json data and return it as a Hash/Array of the data.

`j_get` once again has the ability to be passed arguments, just like `get`.

```ruby
SimpleReq.j_get('https://redxtech.ca/test/simplereq/j_get')
# => {"success" => "'got' web data"}

SimpleReq.j_get('https://redxtech.ca/test/simplereq/j_get_args', {arg1: 'argument_one', arg2: 'argument_two'})
# => {"arg1" => "argument_one", "arg2" => "argument_two"}
```

### Post Json
As with `get`, `j_get` also has a post counterpart.
`SimpleReq.j_post(https://redxtech.ca/test/simplereq/j_post', {arg1: 'argument_one', arg2: 'argument_two'})` will return the same data as the `j_get` version.

### Get Element
Another feature of SimpleReq is it's ability to fetch only a single element of the page by CSS selector (#id, .class, or tag).
```ruby
request = SimpleReq.get_el('https://redxtech.ca/test/simplereq/get_el', '#p2')
request.inner_html
# => "This is p2"
request
# => <p id="p2">This is p2</p>
```

Adding arguments to `get_el` will be handled the same way as with `get`.
`SimpleReq.get_el(url, 'element', {arg: 'val'})`

Each element is returned as an Array or elements. When using `get_el(url).inner_html`, if there are multiple of the same elements, they will be stitched together into a single string.

### Post Element
This feature, of course, allows you to post data to a web page, and grab a single element.
```ruby
request = SimpleReq.post_el('https://redxtech.ca/test/simplereq/post_el', '#p2', {"#p2" => 'id = p2'})
request.inner_html
# => "id = p2"
```

## Future...
One of my plans it to work on making SimpleReq independent from rest-client. I was able to use pure Ruby without any gems to make http requests, but something on my machine prevented it from being able to make https requests. It was working on my linux machines, but not my windows ones, so I decided to make it work fully with everything instead of being dependent on OS.

I plan to add more features in the future, so any suggestions are welcomed. Keep in mind that I do wish to keep it simple.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/RedXTech/SimpleReq.

