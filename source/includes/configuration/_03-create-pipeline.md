## Create pipeline 

```shell
$ curl 'https://ci.example.com/go/tab/admin/pipelines/mypipeline.json' \
      -u 'username:password' \
      -X POST \
      -d 'url=http://svnrepo.com/mysvn/trunk'
```

> The above command returns the following response:

```http
HTTP/1.1 200 OK
Content-Type: text/html; charset=utf-8
```

```
{
  "isValid": "true",
  "error": "",
  "messageId": "Pipeline successfully created."
}
```

Creates a pipeline. 

### HTTP Request

`POST /go/tab/admin/pipelines/:pipeline_name.json`

Creating pipeline supports following parameters.

### General parameters

Parameter name  | Example value            | Required | Description
----------------|--------------------------|----------|------------------------------------------------------------------
pipelineGroup   |	defaultGroup	           | No	      | The name of the Pipeline Group to add the new pipeline to. The pipeline group will be created if it does not already exist.
builder         |	ant	                     | No	      | Can be one of `ant`, `nant`, `rake` or `exec`.
buildfile	      | build.xml                | No	      | Not allowed for exec
target	        | all	                     | No	      | Not allowed for exec
command	        | unittest.sh  arg1 arg2	 | No	      | Required for exec
source	        | pkg	                     | No	      | no default value
dest	          | installer	               | No	      | no default value


### Subversion

Parameter name  | Example value                   | Required  | Description
----------------|---------------------------------|-----------|------------------------------------------------------------------
scm             |	svn	                            | No	      | Default value is `svn`
url             |	http://svnrepo.com/mysvn/trunk	| Yes	      | The URL of the Subversion repository
username	      | checkout_username               | No	      | The SVN username
password        | checkout_password	              | No	      | The SVN password


### Mercurial

Parameter name  | Example value                     | Required  | Description
----------------|-----------------------------------|-----------|------------------------------------------------------------------
scm             |	hg	                              | Yes	      | -
url             |	http://hgrepo.com/hg/my_project	  | Yes	      | The URL of the repository


### Git

Parameter name  | Example value                   | Required  | Description
----------------|---------------------------------|-----------|------------------------------------------------------------------
scm             |	git	                            | Yes	      | -
url             |	git://github.com/foo/bar.git	  | Yes	      | The URL of the repository

### Perforce

Parameter name  | Example value                   | Required  | Description
----------------|---------------------------------|-----------|------------------------------------------------------------------
scm             |	p4	                            | Yes	      | -
url             |	p4server.foo.com:1666	          | Yes	      | The P4PORT of the repository
username	      | checkout_username               | No	      | The P4USER to connect to the repository
password        | checkout_password	              | No	      | The P4PASSWD to connect to the repository
useTickets	    | true or false                   | No	      | -
view            | //depot/... //something/...	    | Yes	      | -

### Team Foundation Server

Parameter name  | Example value                                  | Required  | Description
----------------|------------------------------------------------|-----------|------------------------------------------------------
scm             |	tfs	                                           | Yes	     | -
url             |	http://tfs.host.com:8080/tfs/DefaultCollection | Yes	     | The url of your TFS collection
domain   	      | COMPANYNAME                                    | No	       | Domain name that the given user belong to
username	      | tfsuser                                        | Yes	     | Username used to connect to the collection
password        | tfspassword	                                   | No	       | Password for the given user name
projectPath	    | $/MyProject                                    | Yes	     | Project path in the given collection


### Returns

A text confirmation. 
