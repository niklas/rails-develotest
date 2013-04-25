rails-develotest
================

Get rid of the Rails development environment

Motivation
----------

When Rails projects grow, setting up a representable development environment
becomes harder and harder.

1. Designers should not know about _the one special case_ in your app making it
   i.e. show additional fields of your model or having a specific state.
2. Developers usually have a hard time setting up the situation to reproduce a bug.

All these problems are acually already addressed by BDD tools like [Cucumber](http://cukes.info).

1. Most of the special cases should already be documented in a Feature.
2. Writing a Feature for it helps targetting the bug precisely.

But when the moment comes of styling the page / debugging, Rails' testing
environment does not really help. Classes are cached, most components won't be
re-evaluated even when changed, and additionally the assets from the pipeline
are usually compressed for faster running tests (similar to production).

This is where Develotest comes in:

Usage
-----

1. Write your feature, tag it with @javscript to run it in a real browser
2. Have cucumber step that pauses execution of the suite.
   We use `binding.pry` in 'When I pause' directly after the page is visited the first time
2. Set shell env variable (in bash: `export DEVELOTEST=yes`)
3. Run the feature, wait for the browser to pop up and pause.
4. Edit assets or ruby code in app/
5. Reload page in browser as you would normally do in development
6. Changes should be recognized.
7. repeat at 4.
8. Profit!

Installation
------------

Add `rails-develotest` to your Gemfile

       gem 'rails-develotest', group: 'test'

At the bottom of your `config/environments/test.rb`, but within the `configure` block:

         # .. a lot of config.foo = 23

         Develotest.setup(config)
       end

Bundle. Done.
