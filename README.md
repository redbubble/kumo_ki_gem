# KumoKiGem

Gem for accessing secrets in Amazon's Key Management Service

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kumo_ki_gem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kumo_ki_gem

## Usage

```ruby
cipher_text = KumoKi::KMS.new.encrypt_for('my_staging_environment', 'supersecretkeyoooh')
puts KumoKi::KMS.new.decrypt(cipher_text)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/kumo_ki_gem/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
