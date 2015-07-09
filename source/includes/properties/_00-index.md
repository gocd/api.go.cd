## Get all job properties

```shell
$ curl 'http://ci.example.com/go/properties/PipelineName/541/StageName/1/JobName' \
      -u 'username:password'
```

> The above command returns CSV structure like this:

```shell    
    cruise_agent,                           myLocalAgent,
    cruise_job_duration,                    0,
    cruise_job_id,                          5,    
    cruise_job_result,                      Passed
    cruise_pipeline_counter,                1
    cruise_pipeline_label,                  1
    cruise_stage_counter,                   1    
    cruise_timestamp_01_scheduled,          2015-07-06T18:20:55+05:30,
    cruise_timestamp_02_assigned,           2015-07-06T18:20:55+05:30,
    cruise_timestamp_03_preparing,          2015-07-06T18:20:55+05:30,
    cruise_timestamp_04_building,           2015-07-06T18:20:55+05:30,
    cruise_timestamp_05_completing,         2015-07-06T18:20:55+05:30,
    cruise_timestamp_06_completed           2015-07-06T18:20:55+05:30
```
Lists all job properties

### HTTP Request

`GET /go/properties/:pipeline_name/:pipeline_counter/:stage_name/:stage_counter/:job_name`


<aside class="notice">
  <strong>Note:</strong> 
  You can use keyword 'latest' as a pipeline counter or a stage counter.</p>
</aside>

### Returns

CSV list containing property names and their corresponding value. 