Jellyfish Audit
=======
Adds audit support to [Project Jellyfish] (https://github.com/projectjellyfish/api).

#### Installation
Include in Gemfile:
```
  gem 'jellyfish-audit'
```
or download from GitHub and reference locally:
```
  gem 'jellyfish-audit', path: '../jellyfish-audit'
```
then update `.env` with:
```
  LOG_TO_FILE = true
```
If `LOG_TO_FILE` is set to `true` then API requests will be logged to `/log/audit.txt`: 
```
Controller: SessionsController
Method: POST
Action: create
Format: json
Params: {"staff"=>{"email"=>"admin@projectjellyfish.org", "password"=>"[FILTERED]"}, "controller"=>"sessions", "action"=>"create", "format"=>"json"}
Controller: AlertsController
Method: GET
Action: index
Format: json
Params: {"latest"=>"true", "format"=>:json, "controller"=>"alerts", "action"=>"index"}
...
```
This project uses APACHE LICENSE.