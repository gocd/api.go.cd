## Get all users

```shell
$ curl 'https://ci.example.com/go/api/users' \
      -u 'username:password' \
      -H 'Accept: application/vnd.go.cd.v1+json'
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
      "href": "https://ci.example.com/go/api/users"
    },
    "doc": {
      "href": "http://api.go.cd/#users"
    }
  },
  "_embedded": {
    "users": [
      {
        "_links": {
          "doc": {
            "href": "http://api.go.cd/#users"
          },
          "self": {
            "href": "https://ci.example.com/go/api/users/admin"
          },
          "find": {
            "href": "https://ci.example.com/go/api/users/:login_name"
          }
        },
        "login_name": "jdoe",
        "display_name": "John Doe",
        "enabled": true,
        "email": null,
        "email_me": false,
        "checkin_aliases": [
          "jdoe",
          "johndoe"
        ]
      }
    ]
  }
}
```

Lists all available users.

### HTTP Request

`GET https://ci.example.com/go/api/users`

### Returns

An array of [user objects](#the-user-object).
