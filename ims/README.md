# Overview
This directory contains test for application server integration.
Before running test cases modify `users.csv` with credentials provided by clearwater.

# Configuring Application Server
There exist three methods for configuring application server in clearwater.

1. Using external HSS.
2. Using Ellis web UI.
3. Using Homestead API.

In this document we are going to use 2nd and 3rd method. In order to
add new application server we first login to Ellis node, in docker
case: `docker -it clearewater-docker_ellis_1 bash`.
After successfull login to Ellis node we should edit
`/usr/local/share/clearwater/ellis/web-content/app-server.json` and
add the application server entry.
Here is the content of `app-server.json`:

```json
{
"MCPTT" : "<InitialFilterCriteria><TriggerPoint><ConditionTypeCNF>0</ConditionTypeCNF><SPT><ConditionNegated>0</ConditionNegated><Group>0</Group><Method>INVITE</Method><Extension></Extension></SPT></TriggerPoint><ApplicationServer><ServerName>sip:192.168.1.21:6050</ServerName><DefaultHandling>0</DefaultHandling></ApplicationServer></InitialFilterCriteria>"
}

```

After saving `app-server.json`, you should visit Ellis UI.  Then press
`Configure` button, in the `Application Servers` tab you should see a
check box with entitled `MCPTT`.


## Application Server Verification
In order to verify active application servers for each user, we use homestead API.
Fist we should find the IP address of `homstead-prov` container. 
In `clearwater-docker` case we can use the `show_ips.sh` script that
located in `clearewater-docker/utils` directory. 
For simplicity we first set some environment variables:

```bash
user=sip:6055505545@example.com
hs_hostname=<homestead-prov_ip>
```

Then we should get the path for the user service profile, use the following command 
and look for the value of `Location` header:

```bash
curl -v http://$hs_hostname:8889/public/$user/service_profile
```

Here is the sampl output:
```
* Trying 172.18.0.12...
* Connected to 172.18.0.12 (172.18.0.12) port 8889 (#0)
> GET /public/sip:6505550193@example.com/service_profile HTTP/1.1
> Host: 172.18.0.12:8889
> User-Agent: curl/7.47.0
> Accept: */*
>
< HTTP/1.1 303 See Other
< Server: nginx/1.4.6 (Ubuntu)
< Date: Tue, 21 May 2019 12:05:12 GMT
< Content-Type: text/html; charset=UTF-8
< Content-Length: 0
< Connection: keep-alive
< Location: /irs/eeaaa759-5468-4433-8911-c4b7b45ebe9a/service_profiles/02a2be01-870e-4b38-a870-e3101f6a05e5

```

After finding `Location` header, we can get the current `filter_critera` by following command:

```bash
curl -XGET  http://$hs_hostname:8889/irs/eeaaa759-5468-4433-8911-c4b7b45ebe9a/service_profiles/02a2be01-870e-4b38-a870-e3101f6a05e5/filter_criteria

```
Here is the sample output:

```xml
<?xml version="1.0" encoding="UTF-8"?><ServiceProfile><InitialFilterCriteria><TriggerPoint><ConditionTypeCNF>0</ConditionTypeCNF><SPT><ConditionNegated>0</ConditionNegated><Group>0</Group><Method>INVITE</Method><Extension></Extension></SPT></TriggerPoint><ApplicationServer><ServerName>sip:192.168.1.21:6050</ServerName><DefaultHandling>0</DefaultHandling></ApplicationServer></InitialFilterCriteria></ServiceProfile>
```

NOTE: we used port 6050 for application server, becuase we run the
application server on the same machine that clearwater running, so the
port 5060 is in use with clearwater.

# ue_register.xml
This file test simple registeration with IMS core.

```bash
sipp -t t1 192.168.1.21 -nd -sf ue_register.xml -m 1 -inf users.csv
```

# ue_invite.xml
This test scenario register with IMS core and then send an `INVITE` message.
You should configure clearwater iFC to route the `INVITE` message to the application server, here is `as_invite.xml`.

```bash
sipp -t t1 192.168.1.21 -nd -sf ue_invite.xml -m 1 -inf users.csv -trace_msg
```

# as_invite.xml
This test scenario is an dummy Application Server that send `200 OK` response to received messages.
You should configure clearwater iFC to route the `INVITE` message to the application server, here is `as_invite.xml`.
You should run the following command on the host that reachable from clearwater sprout node.

```bash
sipp -t t1 -p 6050 -nd -sf as_invite.xml -m 1 -trace_msg
```
