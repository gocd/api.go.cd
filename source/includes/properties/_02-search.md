## Search
```shell
$ curl http://goserver.com:8153/go/properties/PipelineName/1243/StageName/1/JobName/PropertyName
      -u 'username:password'
```
> The above command gets the property in csv

| URL format | HTTPVerb | Explanation |
|------------|----------|-------------|
| "http://[server]:8153/go/properties/search?pipelineName=[pipeline]&stageName=[stage]&jobName=[job]&limitPipeline=[pipeline-counter]&limitCount=[number]" | GET | List all historical properties for the pipeline/stage/job upto specified pipeline in csv format. The limitPipeline is optional, which is the last pipeline counter in the list and the default value is the latest pipeline instance. The limitCount is the number of pipeline instances that Go should return. ;limitCount is optional and its default value is 100. |

-   You can use key word 'latest' as a pipeline counter or a stage counter.
-   RESTful urls are case sensitive.
-   Go does not support JSON format for properties API.