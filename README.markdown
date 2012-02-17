Communal
========

An engine for communal experiments.

Welcome to the community.

Community Clarity
=======

In reference to [issue #1](https://github.com/rebelhold/communal/issues/1) [Ellie](https://github.com/Eilie) asked for a clearer description and a way to participate. [m3talsmith](http://github.com/m3talsmith) has added the following:

> The goal of the project is to build the tools needed to run a RebelOutpost of any other community project. We are intentionally keeping users anonymous by default and allowing them to add personal info later on (currently just a nickname).
> 
> Right now I'm building the identity side so that oauth isn't just through services like facebook, twitter, or google. We also hope to build wrappers for other oauth services as well.
> 
> Some of the features envisioned are:
>
> * private encryption dictionaries to encrypt posts and messages (which would be a sort of public/private key)
> * community voting on putting posts on the front page from various users
> * a time share system
> * a bartering system
> * personal theming
> * community theming
> * bitcoin exchanges
> * a scrum planning system
> * an invoice/expense tracking
> * a user rating system
> * a project rating system
> * an outpost rating system
> * a communal (publically owned) resource sharing and tracking program
> * and a shared portfolio
> 
> Basically everything you'll need to easily communicate with each other and the people you do work with.
> 
> This is planned as a decentralized service so connecting to other nodes by user preference will be part of the design.
> 
> Much more planning is in the works...
> 
> If you are interested in helping we have a public pivotal on it that we are building stories with. Or you could just catch me on Skype sometime. My Skype is rebel-michael.

So that's what he says.

This is a community project.

[What do you say?](https://github.com/rebelhold/communal/issues/1)

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

    rvm install 1.9.2

Install MongoDB (using ['Homebrew']('http://mxcl.github.com/homebrew/'))

    brew install mongodb

Follow the onscreen instructions, then download the project:

    git clone git@github.com:rebelhold/communal.git

And accept the gemset creation:

    cd communal

Finally Bundle!

    gem install bundler --no-ri --no-rdoc
    bundle install

