## Get all Agents

```shell
$ curl "https://ci.example.com:8154/go/api/agents" \
     -u "username:password" \
     -H "Accept: application/vnd.go.cd.v1+json"
```

> The above command returns JSON structured like this:

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.go.cd.v1+json; charset=utf-8
```

```json
{
  "_links": {
    "self": {
      "href": "https://ci.example.com/go/api/agents"
    },
    "doc": {
      "href": "http://www.go.cd/documentation/user/current/api/v1/agents.html"
    }
  },
  "_embedded": {
    "agents": [
      {
        "_links": {
          "self": {
            "href": "https://ci.example.com/go/api/agents/adb9540a-b954-4571-9d9b-2f330739d4da"
          },
          "doc": {
            "href": "http://www.go.cd/documentation/user/current/api/v1/agents.html"
          },
          "find": {
            "href": "https://ci.example.com/go/api/agents/:uuid"
          }
        },
        "uuid": "adb9540a-b954-4571-9d9b-2f330739d4da",
        "agent_name": "agent01.example.com",
        "ip_address": "10.12.20.47",
        "enabled": true,
        "sandbox": "/Users/ketanpadegaonkar/projects/gocd/gocd/agent",
        "status": "Idle",
        "os": "Mac OS X",
        "free_space": 84983328768,
        "resources": ["java", "linux", "firefox"],
        "environments": ["perf", "UAT"]
      }
    ]
  }
}
```

Lists all available agents, these are agents that are present in the `<agents/>` tag inside `cruise-config.xml` and also agents that are in `Pending` state awaiting registration.

### HTTP Request

`GET https://ci.example.com/api/agents`

### Returns

An array of [agent objects](#the-agent-object).
