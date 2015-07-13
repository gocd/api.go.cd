## Get all pipelines

```shell
$ curl 'https://ci.example.com/go/api/pipelines.xml' \
      -u 'username:password'
```

> The above command returns XML structured like this:

```http
HTTP/1.1 200 OK
Content-Type: application/xml; charset=utf-8
```

```xml
<pipelines>
 <link rel="self" href="https://ci.example.com/go/api/pipelines.xml"/>
    <pipeline href="https://ci.example.com/go/api/pipelines/pipeline1/stages.xml" />
    <pipeline href="https://ci.example.com/go/api/pipelines/pipeline2/stages.xml" />
</pipelines>
```

Lists all pipelines.


### HTTP Request

`GET /go/api/pipelines.xml`

### Returns

An array of pipelines.
