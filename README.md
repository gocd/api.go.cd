# Go CD API Documentation

[![Build Status](https://snap-ci.com/gocd/api.go.cd/branch/master/build_image)](https://snap-ci.com/gocd/api.go.cd/branch/master)

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

### Releasing a new version of the API

First bump the version in `config.rb`

```
$ vim config.rb                  # Change version in `build_dir`
$ git add config.rb
$ git commit -m 'Bump version'
$ git push
```

Now wait for site to publish via CI (takes a minute), or publish it yourself `./bin/rake publish`. Once the new version is published

```
$ git fetch --all
$ git checkout gh-pages
$ git merge upstream/gh-pages
$ vim versions.json             # edit file and add a new version, set its "type" to "latest", remove the "type" attribute on older version.
$ git add versions.json
$ git commit -m 'Add new version to dropdown'
$ git push
```

## Need help?

* Just submit a issue to the [github repository](https://github.com/gocd/api-docs) if you need any help. And, of course, feel free to submit pull requests with bug fixes or changes.


## Special thanks

* [slate](https://github.com/tripit/slate)
