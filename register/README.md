# Running Test
first run `register_res.gw_c.xml` scenario:
```bash
sipp -t tn -p 5070 -nd -slave s -slave_cfg slave_cfg.csv -sf ./register_res_gw_c.xml -trace_logs -max_socket 100

```

then run `register_req_gw_c.xml` scenaio:
```bash
sipp -t tn -max_socket 20 -p 5062 127.0.0.1:5060 -nd -sf register_req_gw_c.xml -master m -slave_cfg slave_cfg.csv
```
