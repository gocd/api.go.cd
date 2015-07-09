## Get all job properties

```shell
$ curl 'http://ci.example.com/go/properties/PipelineName/541/StageName/1/JobName' \
      -u 'username:password'
```

> The above command returns CSV structure like this (indented for readability):

```csv
cruise_agent,   cruise_timestamp_01_scheduled,  cruise_timestamp_02_assigned
INpoojar.local, 2015-07-09T11:59:08+05:30,      2015-07-09T11:59:16+05:30
```

Lists all job properties.

### HTTP Request

`GET /go/properties/:pipeline_name/:pipeline_counter/:stage_name/:stage_counter/:job_name`

<aside class="notice">
  <strong>Note:</strong>
  You can use keyword 'latest' as a pipeline counter or a stage counter.
</aside>

### Returns

CSV list containing property names and their corresponding value.
