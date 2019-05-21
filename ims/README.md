# Overview
This directory contains test for application server integration.
Before running test cases modify `users.csv` with credentials provided by clearwater.

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