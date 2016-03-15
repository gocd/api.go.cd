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

In this example we'll be releasing version 15.3.0 and setting up master so any new changes from this point go to 16.1.0.

Create a branch for your existing version that you will be releasing

```
git checkout -b 15.3.0
git push upstream 15.3.0
```

Create a new pipeline for this branch on snap-ci.com so any new changes to the 15.3.0 branch are pushed to the correct directory on `gh-pages` branch.

Now bump the version in `config.rb` on the master branch.

```
$ git checkout master
$ vim config.rb                  # Bump version in `build_dir` to `16.1.0`, master is now effectively 16.1.0 (the next release)
$ git add config.rb
$ git commit -m 'Bump version'
$ git push upstream master
```

Now wait for site to publish via CI (takes a minute), or publish it yourself `./bin/rake publish`. Once the new version is published

```
$ git fetch --all
$ git checkout gh-pages
$ git merge upstream/gh-pages
$ vim versions.json             # edit file and add a new version, set its "type" to "latest", remove the "type" attribute on older version.
$ ln -sf 15.3.0 current        # current is now a symlink to 15.3.0
$ git add versions.json current
$ git commit -m 'Add new version to dropdown'
$ git push
```

## Need help?

* Just submit a issue to the [github repository](https://github.com/gocd/api.go.cd) if you need any help. And, of course, feel free to submit pull requests with bug fixes or changes.


## Special thanks

* [slate](https://github.com/tripit/slate)

## Contributing

We encourage you to contribute to Go. For information on contributing to this project, please see our [contributor's guide](http://www.go.cd/contribute).
A lot of useful information like links to user documentation, design documentation, mailing lists etc. can be found in the [resources](http://www.go.cd/community/resources.html) section.

## License

```plain
Copyright 2008-2013 Concur Technologies, Inc.
Copyright 2016 ThoughtWorks, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
