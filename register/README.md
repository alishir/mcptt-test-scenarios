# Running Test
first run `register_res.gw_c.xml` scenario:
```bash
sipp -p 5070 -nd -slave s -slave_cfg slave_cfg.csv -sf ./register_res_gw_c.xml  -trace_logs
```

then run `register_req_gw_c.xml` scenaio:
```bash
sipp -t t1 -p 5062 127.0.0.1:5060 -nd -sf register_req_gw_c.xml -master m -slave_cfg slave_cfg.csv
```
