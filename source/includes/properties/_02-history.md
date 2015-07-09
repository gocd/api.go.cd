## Get historical properties

```shell
$ curl 'http://ci.example.com/go/properties/search?pipelineName=PipelineName&stageName=StageName&jobName=JobName&limitPipeline=latest&limitCount=2' \
        -u 'username:password'
```

> The above command returns CSV structure like this:

```shell
cruise_agent,cruise_job_duration,cruise_job_id,cruise_job_result,cruise_pipeline_counter,cruise_pipeline_label,cruise_stage_counter,cruise_timestamp_01_scheduled,cruise_timestamp_02_assigned,cruise_timestamp_03_preparing,cruise_timestamp_04_building,cruise_timestamp_05_completing,cruise_timestamp_06_completed

myLocalAgent,0,13,Passed,8,4f9e580347b2e259fe030a775771359cdc984346,1,2015-07-07T09:44:27+05:30,2015-07-07T09:44:34+05:30,2015-07-07T09:44:44+05:30,2015-07-07T09:44:46+05:30,2015-07-07T09:44:46+05:30,2015-07-07T09:44:46+05:30

myLocalAgent,0,14,Passed,9,4f9e580347b2e259fe030a775771359cdc984346,1,2015-07-07T10:17:37+05:30,2015-07-07T10:17:45+05:30,2015-07-07T10:17:55+05:30,2015-07-07T10:17:56+05:30,2015-07-07T10:17:56+05:30,2015-07-07T10:17:56+05:30
```


### HTTP Request

`GET /go/properties/search?pipelineName=:pipeline_name&stageName=:stage_name&jobName=:job_name&limitPipeline=:pipeline_counter&limitCount=:number`

<aside class="notice">
  <strong>Note:</strong>
  <code>limitPipeline</code> and <code>limitCount</code> are optional parameters. The default value of <code>limitPipeline</code> is latest pipeline instance's counter. The default value of <code>limitCount</code> is <code>100</code>.
</aside>

### Returns

Job properties as CSV.
