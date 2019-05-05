# docker-submissionbot
Monitor a subreddit for submissions and send them to Slack

Setup
=====

Dependencies
------------

Submissionbot requires Python 3. For a list of required Python 3 libraries, see
``requirements.txt``.

Requirements
------------

You'll first want to setup a Script app to access the Reddit API. See [Reddit Quick Start](https://github.com/reddit-archive/reddit/wiki/OAuth2-Quick-Start-Example#first-steps)

Next, if not already, create a free Slack team. This is used to send submissions to Slack and is meant to work alongside fwump38/docker-modbot (which sends user reports and new modmails to Slack. Once you have a Slack team, you'll need to add an [Incoming Webhook](https://api.slack.com/incoming-webhooks)

Configuration
-------------

Submissionbot uses environment variables in it's docker run command for configuration.

```shell
docker run -t -i -d \
  -e CLIENT_ID=xxxxxxx \
  -e CLIENT_SECRET=xxxxxxx \
  -e SUBREDDIT=some_subreddit \
  -e WEBHOOK=xxxxxxx \
  fwump38/docker-submissionbot
```

### Parameters

* `-e CLIENT_ID` - The Client ID of the Reddit App you setup. **Required**
* `-e CLIENT_SECRET` - The Client Secret of the Reddit App you setup. **Required**
* `-e SUBREDDIT` - The name of the subreddit to monitor. **Required**
* `-e WEBHOOK` - The URL for a Slack Incoming Webhook. **Required**
* `-e CHANNEL` - The Slack Channel to send Submissions to - defaults to #mod_feed otherwise **Optional**

**Note:** To run Submissionbot with multiple subreddits, you will need to spin up additional docker containers. 
This can be simplified using a docker-compose file with each subreddit as it's own service with their own environment variables. See the example [docker-compose](docker-compose.yml.example) file.