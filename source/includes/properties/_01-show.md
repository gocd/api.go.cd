## Get one property

```shell
$ curl 'http://ci.example.com/go/properties/PipelineName/541/StageName/1/JobName'/cruise_agent \
      -u 'username:password'
```

> The above command returns CSV structure like this:

Gets a property by its name

```shell
cruise_agent
myLocalAgent
```

### HTTP Request

`GET /go/properties/:pipeline_name/:pipeline_counter/:stage_name/:stage_counter/:job_name/:property_name`

<aside class="notice">
  <strong>Note:</strong> 
  You can use keyword 'latest' as a pipeline counter or a stage counter.</p>
</aside>

### Returns

Property name and its value.