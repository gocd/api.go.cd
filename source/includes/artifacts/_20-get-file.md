## Get artifact file

```shell
$ curl 'https://ci.example.com/go/files/PipelineName/541/StageName/1/JobName/path/to/file' \
      -u 'username:password'
```

> The above command returns the contents of the file you requested

Gets an artifact file by its path.

### HTTP Request

`GET /go/files/:pipeline_name/:pipeline_counter/:stage_name/:stage_counter/:job_name/*path_to_file`

<aside class="notice">
  The <code>path_to_file</code> can be a nested file for e.g. <code>dist/foobar-widgets-1.2.0.jar</code>
</aside>

### Returns

An the contents of the requested file.
