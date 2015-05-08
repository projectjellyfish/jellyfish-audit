Jellyfish Audit
=======
Adds audit support to [Project Jellyfish] (https://github.com/projectjellyfish/api).

### Installation

#### Setup Gemfile
Include `jellyfish-audit` in Gemfile by loading from GitHub:
```
  gem 'jellyfish-audit', path: '../jellyfish-audit'
```
And run '`bundle install`.

#### Setup Database
To add migrations to Jellyfish API from `jellyfish-audit`, run the following:
```shell
# copy migrations from jellyfish_audit module to jellyfish
rake jellyfish_logger:install:migrations
Copied migration 20150507193348_create_jellyfish_audit_events.jellyfish_logger.rb from jellyfish_audit

# add jellyfish_audit models to jellyfish schema
rake db:migrate
== 20150507193348 CreateJellyfishAuditEvents: migrating =======================
-- create_table(:jellyfish_audit_events)
   -> 0.0108s
== 20150507193348 CreateJellyfishAuditEvents: migrated (0.0109s) ==============
```

#### Setup Env Vars

Specify audit outputs in `.env`:
```
  AUDIT_TO_FILE = true
  AUDIT_TO_DB = true
```

### Outputs

If `AUDIT_TO_FILE` is `true` then API requests will be logged to `/log/audit.txt`: 
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

If `AUDIT_TO_DB` is `true` then API should start adding records to the `jellyfish_audit_events` table: 
![image](https://cloud.githubusercontent.com/assets/9356425/7509759/90096d46-f45a-11e4-9bca-66df98fdd59c.png)


This project uses APACHE LICENSE.
