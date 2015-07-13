## Get pipeline status

```shell

$ curl 'http://ci.example.com/go/api/pipelines/pipeline1/status' \
       -u 'username:password'
```

> The above command returns JSON structured like this:

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
```

```json
{
  "locked": false,
  "paused": true,
  "schedulable": false
}
```

The pipeline status allows users to check if the pipeline is paused, locked and schedulable.

### HTTP Request

`GET /go/api/pipelines/:pipeline_name/status`

### Returns

JSON containing information about pipeline state.
