<a name='contingency'>
# Contingency
</a>

> "Freedom is the recognition of contingency."

>   * *Richard M. Rorty*

Contingency is the custom error page controller you've implemented in every project you've ever written. It's designed to be framework-agnostic and has [many integrations](#supported-integrations) to make using it as easy as calling a config block.

So why implement it yourself again?

It's quick to get started, gives you full customization over Exception coverage, gives you full control over rendering your own error page, and has a contingency plan itself in the event that your custom error views trigger an Exception.

It's also very lightweight: the core functionality (the module in `contingency/plan.rb`) is less than 50 lines; and only adds 3 integration methods, 2 helper methods, and 1 controller action method to your controller. Everything but the controller method is private.

<a name='table-of-contents'>
## Table of Contents
</a>

* [Installation](#installation)
* [Configuration](#configuration)
* [Supported Integrations](#supported-integrations)
    * [Rails](#rails-integration)
* [Integrating Contingency Yourself](#integrating-contingency-yourself)
    * [Integration API](#three-integration-methods)
    * [Please Contribute](#please-contribute)
* [Versioning](#versioning)s
    * [Contingency Versioning](#contingency-versioning)
    * [Integration Versioning](#contingency-integration-versioning)
* [Contributing Integrations](#contributing-integrations)
* [Contributing to Contingency](#contributing-to-contingency)
* [Credits](#credits)
    * [Contributers](#contributers)
    * [Shout-Outs](#shout-outs)

<a name='installation'>
## Installation
</a>

Add this line to your application's Gemfile:

    gem 'contingency-my_framework_name',  '~> x.0', require: 'contingency/adapters/my_framework_name'

...where [`my_framework_name`](#supported-integrations) is the name of your framework, and `x` is the major version of the framework you're using.

Then, execute:

    $ bundle

<a name='configuration'>
## Configuration
</a>

Contingency

<a name='supported-integrations'>
## Supported Integrations
</a>

<table>
  <thead>
    <tr>
      <td>Integration</td>
      <td>Integration Quality</td>
      <td>Supported Versions</td>
      <td>Maintainer</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <a href='https://www.github.com/christhekeele/contingency_rails'>Rails</a>
      </td>
      <td>
        **Bad**
      </td>
      <td>
        <a href='https://rubygems.org/gems/contingency_rails'>3.x</a>
      </td>
      <td>
        <a href='https://www.github.com/christhekeele/contingency_rails/issues'>christhekeele</a>
      </td>
    </tr>
  </tbody>
</table>

**Great** integrations have functional tests and good documentation, **good** integrations only have functional tests, **poor** integrations only have documentaion, and **bad** ones have neither.

<a name='integrating-contingency-yourself'>
## Integrating it Yourself
</a>

If the framework you're using doesn't have a Contingency integration, you're only 3 methods away from integrating it yourself.

<a name='three-integration-methods'>
### Integration API
</a>

<a name='please-contribute'>
### Please Contribute
</a>

If you decide to go through this trouble, you really should consider [contributing your Contingency integration](#contributing-integrations) to Contingency.</a>

<a name='versioning'>
## Versioning
</a>

<a name='contingency-versioning'>
### Contingency Versioning
</a>

Contingency itself is versioned as it changes. It bumps its major version as its API changes, which is rarely, as its public API only requires [3 methods](#three-integration-methods). It uses [symantic versioning](http://http://semver.org/). This means you should safely be able to install it with [loose bundler dependencies](#installation).

<a name='contingency-integration-versioning'>
### Integration Versioning
</a>

Contingency integrations should take their major version number from [their frameworks](#supported-integrations). The rest is up to the maintainer.

<a name='contributing-integrations'>
## Contributing Integrations
</a>

See [contingency_rails](https://www.github.com/christhekeele/contingency_rails) as an example.

1. Create a new gem named after your framework (`bundle gem contingency-my_integration`)
1. Add Contingency as a dependency to your gemspec and bundle install
1. Generate an integration template (`bundle exec rake contingency:generate:plan[my_integration]`)
1. Implement the 3 API methods that rake instructs you to
1. Commit your changes (`git commit -am 'Created my_integration'`)
1. Push (`git push origin master`)
1. Create the intital build of your gem (`gem build contingency-my_integration`)
1. Release your gem (`gem push contingency-my_integration.gem`)
1. Revel in the fact that you've provided a Contingency plan for you and yours
1. Follow [the steps below](#contributing-to-contingency) to update this README with links to your Contingency integrationaccepted


<a name='contributing-to-contingency'>
## Contributing to Contingency
</a>

1. Fork it
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Add the name of your integration to the integrations array in the contingency/integration.rb file if [you're contributing a Contingency integration](#contributing-integrations)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create new Pull Request

<a name='credits'>
## Credits
</a>

<a name='contributers'>
### Contributers
</a>

* None, aside from [the creator](https://www.github.com/christhekeele). [Be the first!](#contributing-to-contingency)!

<a name='shout-outs'>
### Shout-Outs
</a>

* Thanks to [ryanb](https://github.com/ryanb), and his subscription-worthy [Railscasts](http://railscasts.com/), which have inspired us all. Especially us [Pro users](http://railscasts.com/pro).
