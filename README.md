# Go CD API Documentation

[![Build Status](https://snap-ci.com/ketan/api.go.cd/branch/master/build_image)](https://snap-ci.com/ketan/api.go.cd/branch/master)

Checkout the live documentation at http://api.go.cd

# Contributing to the API Documentation

### Configure and install middleman

```
$ bundle install --path .bundle --binstubs
```

### Serve the documentation locally

```
$ ./bin/middleman server
```

### Generating the static website

```
$ ./bin/rake build
```

### Publish the website to Github Pages

```
$ ./bin/rake publish
```

## Need help?

* Just submit a issue to the [github repository](https://github.com/gocd/api-docs) if you need any help. And, of course, feel free to submit pull requests with bug fixes or changes.


## Special thanks

* [slate](https://github.com/tripit/slate)
