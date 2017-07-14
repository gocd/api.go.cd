# Introduction

Welcome to the GoCD API! You can use our API to access GoCD API endpoints, which can get information about the server's configuration and build history. In addition it can be used to update configuration and execute builds.

We currently provide language bindings in Shell! You can view code examples on the right-hand side of the page.

All APIs SHOULD be accessed from `https://go-server-url:8154/go/api`. All data SHOULD be sent and recieved as JSON, specifically `application/vnd.go.cd.v1+json`. You may access the APIs over plain text, but for security reasons we suggest that you use SSL.

## API versions

It is recommended to explicitly request the version of an API via the `Accept` header.

`Accept: application/vnd.go.cd.v1+json`

`Accept: application/vnd.go.cd.v2+json` etc

If you specify an unsupported Accept header, GoCD will respond with the error message `The url you are trying to reach appears to be incorrect`.

<aside class="notice">
  <strong>Important:</strong> The version of an API may change in the future. If you care about the stability of the API, make sure that you are requesting a specific version in the <code>Accept</code> header as shown in the example above.
</aside>
