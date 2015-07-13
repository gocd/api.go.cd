## Get job

```shell
$ curl 'https://ci.example.com/go/api/jobs/2.xml' \
      -u 'username:password'
```

> The above command returns XML structured like this:

```http
HTTP/1.1 200 OK
Content-Type: application/xml; charset=utf-8
```

```xml
<job name="defaultJob">
  <link rel="self" href="https://ci.example.com/go/api/jobs/2.xml"/>
  <id><![CDATA[urn:x-go.studios.thoughtworks.com:job-id:mypipeline:2:defaultStage:1:defaultJob]]></id>
  <pipeline name="mypipeline" counter="2" label="2"/>
  <stage name="defaultStage" counter="1" href="https://ci.example.com/go/api/stages/2.xml"/>
  <result>Cancelled</result>
  <state>Completed</state>
  <properties>
    <property name="cruise_agent"><![CDATA[INpicke.local]]></property>
    <property name="cruise_job_duration"><![CDATA[0]]></property>
    <property name="cruise_job_id"><![CDATA[2]]></property>
    <property name="cruise_job_result"><![CDATA[Cancelled]]></property>
    <property name="cruise_pipeline_counter"><![CDATA[2]]></property>
    <property name="cruise_pipeline_label"><![CDATA[2]]></property>
    <property name="cruise_stage_counter"><![CDATA[1]]></property>
    <property name="cruise_timestamp_01_scheduled"><![CDATA[2015-07-10T11:59:43+05:30]]></property>
    <property name="cruise_timestamp_02_assigned"><![CDATA[2015-07-10T11:59:52+05:30]]></property>
    <property name="cruise_timestamp_03_preparing"><![CDATA[2015-07-10T12:00:02+05:30]]></property>
    <property name="cruise_timestamp_06_completed"><![CDATA[2015-07-10T12:00:04+05:30]]></property>
  </properties>
  <agent uuid="278fb0b6-d3b8-47e1-9443-67f26bfb5c15"/>
  <artifacts baseUri="https://ci.example.com/go/files/mypipeline/2/defaultStage/1/defaultJob" pathFromArtifactRoot="pipelines/mypipeline/2/defaultStage/1/defaultJob"/>
  <resources/>
  <environmentvariables/>
</job>
```

Gets XML representation of job.

### HTTP Request

`GET /go/api/jobs/:job_id.xml`


### Returns

A job object.
