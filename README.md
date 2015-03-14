# Docker Mono .NET Demo 
Example self-hosted [Nancy](http://nancyfx.org/) API running on Mono, in a minimal Docker image (< 20mb)

Uses a local Vagrant Debian Wheezy box to build the linux artifact for embedding as a static binary in the Docker container.

## Getting Started
*Note*: You will need [Vagrant](http://vagrantup.com) and [Virtualbox](http://virtualbox.org/) for this, or otherwise a working local Mono distribution on a Linux host.

```
vagrant up
vagrant ssh
./build sh
logout
docker build -t mfellows/mono-api .
docker run -d -p 8888:8888 mfellows/mono-api
```

You can now hit your API on port `8888`:

```
curl $(boot2docker ip):8888
Hello World
```

## Performance
As an interesting side note, it still performs quite well with no tuning. My host Mac OSX the running Virtualbox process sits around 5% CPU usage during this basic stress test.

```
ab -c 100 -n 10000 "$(boot2docker ip):8888/"
```

Output:

```
mfellows@matt.mit ~/development/public/mono-api/console $ ab -c 100 -n 10000 "$(boot2docker ip):8888/"
This is ApacheBench, Version 2.3 <$Revision: 655654 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 192.168.59.104 (be patient)
Completed 1000 requests
Completed 2000 requests
Completed 3000 requests
Completed 4000 requests
Completed 5000 requests
Completed 6000 requests
Completed 7000 requests
Completed 8000 requests
Completed 9000 requests
Completed 10000 requests
Finished 10000 requests


Server Software:        Mono-HTTPAPI/1.0
Server Hostname:        192.168.59.104
Server Port:            8888

Document Path:          /
Document Length:        11 bytes

Concurrency Level:      100
Time taken for tests:   12.145 seconds
Complete requests:      10000
Failed requests:        0
Write errors:           0
Total transferred:      1370000 bytes
HTML transferred:       110000 bytes
Requests per second:    823.42 [#/sec] (mean)
Time per request:       121.445 [ms] (mean)
Time per request:       1.214 [ms] (mean, across all concurrent requests)
Transfer rate:          110.16 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    3   1.7      2      20
Processing:     9  118  14.7    117     166
Waiting:        9  118  14.7    117     166
Total:         12  121  14.6    120     172

Percentage of the requests served within a certain time (ms)
  50%    120
  66%    126
  75%    129
  80%    132
  90%    140
  95%    147
  98%    153
  99%    157
 100%    172 (longest request)
```
