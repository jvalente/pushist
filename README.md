Pushist
=======

A small / embrionary sinatra app that connects Github and [Wedoist](http://wedoist.com) taking advantage of Github Webhooks and Wedoist API.
Documentation is an ongoing process. :)

Instalation
=======
1. Get the code
    git clone https://github.com/jvalente/pushist.git

2. Configure the app to post on your projects
   
  Add a `config.yml`file to the `config/` folder.

  Wedoist.com does not provide an API key, since there is not official API support yet - https://wedoist.com/Support/showQuestion/572/. This means that Pushist will need to login as a normal user to be able to post on the timeline. This login information has to be added to the `config.yml` file as well as the the project id that you want to integrate with github and the name for the template message you want to use (this is optional). All this info should be nested under a block with the name of the repo you want to track (check `config.yml.example` as an example). Add as many blocks as you want (one account can interact with different projects)
  

3. Deploy the app (an example follows considering a deploy to heroku)
    heroku create pushist --stack cedar
    git push heroku master

4. Add http://yourappdomain/listen as a WebHook URL to the github repos you want to track on Wedoist (Check: [Post-Receive Hooks](https://help.github.com/articles/post-receive-hooks))

5. In case you have created a Wedoist account for this purpose don't forget to invite it to the projects you need

Message Templates
=======

Under the folder `templates/` you can add other templates to better suit your needs. This represent the format of the message that will be posted as a status update. The default template will produce something like this:

![pushistexample](http://f.cl.ly/items/3m1h3l0B3o430T0U2P0c/Screen%20Shot%202012-07-05%20at%205.36.02%20PM.png)

[Pushist avatar credits to Jason Costello :D](http://http://octodex.github.com/supportcat/)


Contact
=======

Feedback / Questions [@jvalente](http://twitter.com/jvalente)
