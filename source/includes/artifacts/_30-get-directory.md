## Get artifact directory

```shell
$ curl 'https://ci.example.com/go/files/PipelineName/541/StageName/1/JobName/path/to/directory.zip' \
      -u 'username:password'
```

> The above command returns the contents of the directory you requested as a compressed zip file.

Gets an artifact directory by its path.

### HTTP Request

`GET /go/files/:pipeline_name/:pipeline_counter/:stage_name/:stage_counter/:job_name/*path_to_directory.zip`

<aside class="notice">
  The <code>path_to_directory</code> can be a nested directory for e.g. <code>target/dist.zip</code>
</aside>

<aside class="warning">
  Since it may take an undetermined amount of time to compress a directory, the server <em>may</em> return a <code>202 Accepted</code> code to indicate that it is compressing the requested directory.
  <br/><br/>
  Users are expected to poll the url every few seconds to check if the directory is available.
</aside>

### Returns

One of -

* A status code `202 Accepted` to acknowledge your request to compress the contents of the requested directory.
* The requested directory contents in the form of a zip file.
