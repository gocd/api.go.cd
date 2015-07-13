## Cancel stage

```shell
$ curl 'https://ci.example.com/go/api/stages/myPipeline/myStages/cancel' \
      -u 'username:password' \
      -X POST
```

> The above command returns the following response:

```http
HTTP/1.1 200 OK
Content-Type: text/html; charset=utf-8
```

```
Stage cancelled successfully.
```
Cancel an active stage of a specified stage.

### HTTP Request

`POST /go/api/stages/:pipeline_name/:stage_name/cancel`

### Returns

A text confirmation.
