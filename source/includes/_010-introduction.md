# Introduction

Welcome to the GoCD API! You can use our API to access GoCD API endpoints, which can get information about the server's configuration and build history. In addition it can be used to update configuration and execute builds.

We currently provide language bindings in Shell! You can view code examples on the right-hand side of the page.

All APIs SHOULD be accessed from `https://go-server-url:8154/go/api`. All data SHOULD be sent and recieved as JSON, specifically `application/vnd.go.cd.v1+json`. You may access the APIs over plain text, but for security reasons we suggest that you use SSL.

## Current Version

By default, all requests receive **Version 1** of the API. It is recommended to explicitly request this version via the `Accept` header.

`Accept: application/vnd.go.cd.v1+json`

If you specify an unsupported, Accept header, GoCD will respond with the current default JSON representation of the resource.

<aside class="notice">
  <strong>Important:</strong> The default version of the API may change in the future. If you care about the stability of the API, make sure that you are requesting a specific version in the <code>Accept</code> header as shown in the example above.
</aside>
