## Running simple_rtp_sender
First run ffplay to receive the RTP stram: `ffplay -nodisp -v info rtp://127.0.0.1:12345`.
Then run the SIPp test scenario: `sipp 127.0.0.1:5060 -nd -sf simple_rtp_sender.xml -m 1`
