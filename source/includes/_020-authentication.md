# Authentication

All APIs require you to authenticate yourself using your username and password. A cookie will also be returned as a result of the first authentication call. You may use this cookie for any further authentication attempts. If authentication fails, Go may return status codes `401`, `403` or `404`.

## Basic authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
$ curl 'https://ci.example.com/go/api/agents' \
      -u 'username:password' \
      -H 'Accept: application/vnd.go.cd.v1+json' \
```

> Make sure to replace the `username` and `password` with the username and password that you use to access the go server. The above command returns the following response:

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.go.cd.v1+json; charset=utf-8
Set-Cookie: JSESSIONID=15kvus1kdrec46vk2a6jmtmo;Path=/go;Expires=Mon, 15-Jun-2015 10:16:20 GMT
```

```json
{
  "_links": {
    "self": {
      "href": "https://ci.example.com/go/api/agents"
    },
    "doc": {
      "href": "https://api.gocd.io/#agents"
    }
  },
  "_embedded": {
    "agents": []
  }
}
```

To use Basic Authentication with the Go API, simply send the username and password associated with the account.

## Cookie/Session authentication

Using the cookie/session returned from the previous API call, one can make further API calls. Using a cookie will dramatically improve performance of API calls especially if go is authenticating against an external source like LDAP.

```shell
$ curl 'https://ci.example.com/go/api'
      -b 'JSESSIONID=15kvus1kdrec46vk2a6jmtmo' \
      -H 'Accept: application/vnd.go.cd.v1+json'
```

> The above command returns the following response

```http
HTTP/1.1 200 OK
Content-Type: application/vnd.go.cd.v1+json; charset=utf-8
Set-Cookie: JSESSIONID=15kvus1kdrec46vk2a6jmtmo;Path=/go;Expires=Mon, 15-Jun-2015 10:16:20 GMT
```

```json
{
  "_links": {
    "self": {
      "href": "https://ci.example.com/go/api/agents"
    },
    "doc": {
      "href": "https://api.gocd.io/#agents"
    }
  },
  "_embedded": {
    "agents": []
  }
}
```

