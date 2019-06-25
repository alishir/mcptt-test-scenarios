sipp -t u1 192.168.1.21 -i 10.189.219.4 -nd -sf ue_announcer.xml -m 1 -inf users.csv -trace_msg -message_file log/ue_invite.log -slave s -slave_cfg nodes.csv
sipp -t u1 192.168.1.21 -i 10.189.219.4 -nd -sf ue_announcer_reg.xml -m 1 -inf users.csv -trace_msg -message_file log/ue_reg.log -master m -slave_cfg nodes.csv
