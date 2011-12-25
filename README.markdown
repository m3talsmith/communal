Communal
========

An engine for communal experiments.

Welcome to the community.

Requirements
============

- Ruby 1.9.2
- Bundler
- MongoDB

Installation
============

Most of the core developers use Lion and deploy to Heroku. Though one of the near future plans is to make communal node decentralized. So, we are seeking developers from other platforms to add to this. If you are one of those other developers cheers!

Mac OS X Lion
-------------

If you are using RVM we have a .rvmrc file that will automatically create a gemset for you.

If you don't have Ruby 1.9.2 installed:

> rvm install 1.9.2

Install MongoDB (using ['Homebrew']('http://mxcl.github.com/homebrew/'))

> brew install mongodb

Follow the onscreen instructions, then download the project:

> git clone git@github.com:rebelhold/communal.git

And accept the gemset creation:

> cd communal

Finally Bundle!

> gem install bundler --no-ri --no-rdoc
>
> bundle install

