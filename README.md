<a name='contingency'>
# Contingency
</a>

> "Freedom is the recognition of contingency."

>   * *Richard M. Rorty*

Contingency is the custom error page controller you've implemented in every project you've ever written. It's compatibile with every framework you've ever implemented a project in. A [Contingency Plan](#supported-integrations) has been written for every Ruby framework you're familiar with. And odds are, its better tested than your implementation.

So for the love of god, stop implementing it yourself.

It's quick to get started, gives you full customization over Exception coverage, gives you full control over rendering your own error page, and has a contingency plan itself in the event that your custom error views trigger an Exception.

It's also very lightweight: the core functionality (the module in `contingency/plan.rb`) is less than 50 lines; and only adds 3 integration methods, 2 helper methods, and 1 controller action method to your controller. Everything but the controller method is private. The rest of the codebase else is just a matter of integration. It's a hard codebase to get lost in.

Experience true freedom, and make yourself a Contingency Plan.

<a name='table-of-contents'>
## Table of Contents
</a>

* [Installation](#installation)
* [Configuration](#configuration)
* [Supported Integrations](#supported-integrations)
    * [Rails](#rails-integration)
* [Custom Integrations](#custom-integrations)
    * [Integrating Contingency Yourself](#integrating-contingency-yourself)
        * [Integration Dependencies](#three-integration-methods)
* [Versioning](#versioning)
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

Add these lines to your application's Gemfile:

    gem 'contingency',                    '~> 1.0'
    gem 'contingency_my-framework-name',  '~> x.0'

...where [my-framework-name](#supported-integrations) is the name of your framework.

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
      <td>Contingency Plan</td>
      <td>Integration Quality</td>
      <td>Version</td>
      <td>Maintainer</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <a href='#rails-integration'>Rails</a>
      </td>
      <td>
        <a href='#poor-dependency-management'>Poor</a>
      </td>
      <td>
        <a href='https://www.github.com/christhekeele/contingency_rails'>0.0.1</a>
      </td>
      <td>
        <a href='https://www.github.com/christhekeele/contingency_rails/issues'>christhekeele</a>
      </td>
    </tr>
  </tbody>
</table>

<a name='rails-integration'>
### Rails
</a>

<a name='custom-integrations'>
## Custom Integrations
</a>

If the framework you're using doesn't have a Contingency Plan integration, you're only 3 methods away from integrating it yourself.

<a name='integrating-contingency-yourself'>
### Integrating it Yourself
</a>

It's easy to integrate Contingency into your own app. Contingency only relys on 3 methods to communicate with your framework:

<a name='three-integration-methods'>
#### Integration Dependencies
</a>

<a name='for-the-love-of-god-contribute'>
</a>

If you decide to go through this trouble, you really should consider [contributing your Contingency Plan integration](#contributing-integrations) to Contingency.</a> I'll be more than happy to help you develop your integration until [it meets our minimum quality standards](#versioning), if it doesn't out-of-the-box.

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

<a name='great-dependency-management'>
#### Great
</a>

Contingency Plans should be versioned [with their frameworks](#supported-integrations). Integrations that follow this simple requirement are labeled as [**great**](#supported-integrations).

<a name='good-dependency-management'>
#### Good
</a>

Contingency Plans that keep up with at least [the major version of their framework](http://http://semver.org/) will result in the integration being labeled as [**good**](#supported-integrations).

<a name='poor-dependency-management'>
#### Poor
</a>

Contingency Plans that fail to keep up with [the major version of their framework](http://http://semver.org/) will result in the integration being labeled as [**poor**](#supported-integrations).

<a name='bad-dependency-management'>
#### Bad
</a>

Contingency Plans that throw off the shackles of [symantic versioning](http://http://semver.org/) and don't follow it from the get-go, Pull Request, or fall very behind will result in the integration being labeled as [**bad**](#supported-integrations).

I keep up with these frameworks through [the Bundle Scout](https://bundlescout.com). You should, too! **Checkest thineself lest thy wrekest thineself**.

<a name='contributing-integrations'>
## Contributing Integrations
</a>

See [contingency_rails](https://www.github.com/christhekeele/contingency_rails) as an example.

1. Create a new gem named after your framework (`bundle gem contingency-my_integration`)
1. Add Contingency as a dependency to your gemspec and bundle install
1. Generate an integration template (`bundle exec rake contingency:generate:plan[my_integration]`)
1. Implement the 3 methods that rake instructs you to
1. Commit your changes (`git commit -am 'Created my_integration'`)
1. Push (`git push origin master`)
1. Follow [the steps below](#contributing-to-contingency) to add autoloading your Contingency Plan in Contingency core and wait get your Pull Request accepted
1. Create the intital build of your gem (`gem build contingency-my_integration`)
1. Release your gem (`gem push contingency-my_integration.gem`)
1. Revel in the fact that you've provided a Contingency Plan for you and yours
1. Continue to mantain your integration over time by [handling API changes and bumping the version number in accordance with the framework](#versioning), lest your integration be marked as deprecated.


<a name='contributing-to-contingency'>
## Contributing to Contingency
</a>

1. Fork it
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Add the name of your integration to the integrations array in the contingency/integration.rb file if [you're contributing a Contingency Plan](#contributing-integrations)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create new Pull Request
1. I tell you to go back and write some tests if you haven't already
1. I tell you to go back and update the README.md if you haven't already
1. I accept your Pull Request

<a name='credits'>
## Credits
</a>

<a name='contributers'>
### Contributers
</a>

* None, aside from [the creator](https://www.github.com/christhekeele/contingency). [Be the first!](#contributing-to-contingency)!

<a name='shout-outs'>
### Shout-Outs
</a>

* Thanks to [nathanl](https://github.com/nathanl) and his excellent authorization gem, [Authority](https://github.com/nathanl/authority), the structure of which inspired this one.
* Thanks to [ryanb](https://github.com/ryanb), and his subscription-worthy [Railscasts](http://railscasts.com/), which have inspired us all. Especially us [Pro users](http://railscasts.com/pro).
