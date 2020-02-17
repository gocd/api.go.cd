# Introduction

Welcome to the GoCD API! You can use our API to access GoCD API endpoints, which can get information about the server's configuration and build history. In addition it can be used to update configuration and execute builds.

We currently provide language bindings in Shell! You can view code examples on the right-hand side of the page.

All APIs SHOULD be accessed from `https://go-server-url:8154/go/api`. All data SHOULD be sent and recieved as JSON, specifically `application/vnd.go.cd[.VERSION]+json`. You may access the APIs over plain text, but for security reasons we suggest that you use TLS.

## API versions

It is recommended to explicitly request the version of an API via the `Accept: application/vnd.go.cd[.VERSION]+json` header, with an appropriate version. Some examples are:

`Accept: application/vnd.go.cd.v1+json`

`Accept: application/vnd.go.cd.v2+json` etc

Each documented API endpoint shows the correct version to use in its usage documentation.

Beginning with GoCD version 19.8, it is possible to omit the version number by specifying `Accept: application/vnd.go.cd+json`. This will render the latest version.

<aside class="notice">
  <strong>Important:</strong> The version of an API may change in the future. If you're building an application and care about the stability of the API, make sure that you are requesting a specific version in the <code>Accept</code> header as shown in the example usage of each documented API endpoint.
</aside>

If you specify an unsupported `Accept` header, GoCD will respond with a status code `404` error message `The url you are trying to reach appears to be incorrect`.

## GoCD Deprecated APIs

GoCD may deprecate APIs for any of the following reasons:

- Use of the API is unsafe.
- An improved alternative API is available.
- Breaking changes to the API are expected in a future release(s).

In order to convey the API deprecation information to the API consumers, GoCD adds following deprecation headers for a deprecated API:

* `X-GoCD-API-Deprecated-In`:
  This Response header denotes the GoCD Version when the API was deprecated.

* `X-GoCD-API-Removal-In`:
  This Response header denotes the GoCD Version when the API will be removed.
  
* `X-GoCD-API-Deprecation-Info`:
  This Response header provides a link to the GoCD API deprecation documentation.

* `Link`:
  This Response header has following 3 parts:
  * `Link`: The successor API link.
  * `Accept Header`: The successor API's version [Accept Header](#api-versions).
  * `rel`: The relation of the link with the deprecated API. This field has a fixed value `successor-version` denoting the specified link and the accept header is the successor of the deprecated API.

* `Warning`:
  This Response header has following 3 parts:
  * `Code`: The warning code. This field has a fixed value 299. Know more about warn-code at [MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Warning).
  * `Agent`: The warning agent. This field represents the GoCD version adding the warning in the format `GoCD/<GoCD_Vesion>`
  * `Message`: The warning message.


### Revoking deprecations

Occasionally, the deprecation of an API may be modified/reversed for some unavoidable reasons. In such situations, the subsequent GoCD releases will provide the updated deprecated headers with information relevant to the decision.
Refer [changelog](#api-changelog) section for the list of deprecated APIs.  

                                      

