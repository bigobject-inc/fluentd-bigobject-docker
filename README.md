# fluentd-bigobject-docker

This image contains Fluentd and the output plugins (out_bigobject.rb, out_bigobject_avro.rb) for sending data to BigObject. It provides an example where the user wish to monitor a file, and insert data into BigObject when new rows are added. 

## How to build 

To build the image

```apache
docker build -t bigobject/fluentd-bigobject .
```

## How to use 

```apache
docker run -t -d --name my_fluentdbo -v /path/to/dir:/fluentd/input bigobject/fluentd-bigobject 
```

/fluentd/input is where the file to be monitored is located. 

Default configuration in docker is “fluent.conf” located in /fluentd/etc. To use your own fluentd configuration file, execute “docker run” with “-v /path/to/dir:/fluentd/etc” and “-e FLUENTD_CONF=yours.conf”.  Eg. 

```apache
docker run -t -d --name my_fluentdbo -v /path/to/dir:/fluentd/input -v /path/to/dir:/fluentd/etc -e FLUENTD_CONF=yours.conf bigobject/fluentd-bigobject 
```

The fluent.conf in this image provides an example where the user wish to monitor a file (eg. /fluentd/input/Customer.csv) , and insert data into BigObject (Customer table) when new rows are appended to the file. The table to be inserted (in this case “Customer”) needs to be created in advance on BigObject if avro schema file is not provided. 

```apache
CREATE TABLE Customer ('id' STRING, 'name' STRING, 'language' STRING, 'state' STRING, 'company' STRING, 'gender' STRING, 'age' INT32)
```



