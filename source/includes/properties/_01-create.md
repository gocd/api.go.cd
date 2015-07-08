## Create

```shell
curl -d "value=PropertyValue" http://goserver.com:8153/go/properties/PipelineName/1243/StageName/1/JobName/MyPropertyName
      -u 'username:password'
```
> The above command defines new property 

| URL format | HTTPVerb | Explanation |
|------------|----------|-------------|
| http://[server]:8153/go/properties/[pipeline]/[pipeline-counter]/[stage]/[stage-counter]/[job]/[property-name] | POST | Create a property with value to the specific pipeline/stage/job. |