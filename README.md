# Go CD API Documentation

[![Build Status](https://snap-ci.com/gocd/api.go.cd/branch/master/build_image)](https://snap-ci.com/gocd/api.go.cd/branch/master)

Checkout the live documentation at https://api.go.cd

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

Assuming current stable is `16.3.0`, you are about to release `16.4.0` and the next version is going to be `16.5.0`, you would execute —

```bash
rake bump_version CURRENT_VERSION=16.3.0 VERSION_TO_RELEASE=16.4.0  NEXT_VERSION=16.5.0 REMOTE_NAME=upstream
```

## Need help?

* Just submit a issue to the [github repository](https://github.com/gocd/api.go.cd) if you need any help. And, of course, feel free to submit pull requests with bug fixes or changes.


## Special thanks

* [slate](https://github.com/tripit/slate)

## Contributing

We encourage you to contribute to Go. For information on contributing to this project, please see our [contributor's guide](https://www.go.cd/contribute).
A lot of useful information like links to user documentation, design documentation, mailing lists etc. can be found in the [resources](https://www.go.cd/community/resources.html) section.

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
