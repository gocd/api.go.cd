## List & Show
```shell
$ curl http://goserver.com:8153/go/properties/PipelineName/1243/StageName/1/JobName 
      -u 'username:password'
```
> The above command list properties in csv


```shell
$ curl http://goserver.com:8153/go/properties/search?pipelineName=PipelineName&stageName=StageName&jobName=JobName&limitCount=100"
      -u 'username:password'
```
> The above command gets the history of properties in csv for the job.
> The quotes are required.

| Method | URL format | HTTPVerb | Explanation |
|--------|------------|----------|-------------|
| List | http://[server]/go/properties/[pipeline]/[pipeline-counter]/[stage]/[stage-counter]/[job] | GET | List all properties for the specific pipeline/stage/job in csv format. |
| Show | http://[server]/go/properties/[pipeline]/[pipeline-counter]/[stage]/[stage-counter]/[job]/[property-name] | GET | Get the value of the property [property-name] of the specific pipeline/stage/job with csv format. |
