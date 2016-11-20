# SimpleReq

SimpleReq is a simple requests library for Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'SimpleRequest'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install SimpleReq

## Usage

Using SimpleReq can be as simple as:
 ```ruby
request = SimpleReq.get('https://redxtech.ca/test/simplereq/get')
request.body
# => "<!DOCTYPE HTML><html>...</html>"
request.code
# => 200
```
`SimpleReq.get` returns an object that can be interacted with by `.body` and `.code`. `.body` returns a string of the HTML document, and `.code` returns a integer of the HTTP response code.

You can also pass a Hash to the get method (`SimpleReq.get('https://redxtech.ca/test/simplereq/get_args), {arg1: 'argument_one', arg2: 'argument_two'}`), which will instead get `https://redxtech.ca/test/simplereq/get_args?arg1=argument1&arg2=argument_two`

SimpleReq also supports `post`ing data to web pages as well.
```ruby
request = SimpleReq.post('https://redxtech.ca/test/simplereq/post', {arg1: 'argument_one', arg2: 'argument_two'})
```
This will return the same way as `SimpleReq.get`, except it will show the page as it would with the data `post`ed.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/RedXTech/SimpleReq.

