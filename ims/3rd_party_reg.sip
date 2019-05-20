REGISTER sip:192.168.1.21:6050 SIP/2.0
Via: SIP/2.0/TCP 172.21.0.9:5052;rport;branch=z9hG4bKPjt6EFDrUHbFs9FqEebu5-A5-8ncYpW5LM
Max-Forwards: 70
From: <sip:sprout>;tag=QeINP6Z050bs6-UWAyaCOXQuKoU.0sqR
To: <sip:6505550769@example.com>
Contact: <sip:sprout:5054;transport=tcp>
Call-ID: Ty-uo9TcW5gWfTJt.RFdBurN-FfernLw
CSeq: 1 REGISTER
Expires: 300
P-Visited-Network-ID: example.com
Content-Type: message/sip
Content-Length:  1027

REGISTER sip:sprout:5054;transport=tcp SIP/2.0
Path: <sip:+qmhICJPGA@172.21.0.10:5058;transport=TCP;lr;ob>
Via: SIP/2.0/TCP icscf.sprout;branch=z9hG4bKPjIGE4ibw8DLRGi331NM0zy6en-Sd.Cnpg
Via: SIP/2.0/TCP 172.21.0.10:5058;rport=36125;received=172.21.0.10;branch=z9hG4bKPjxuY2lHivhUO93oZEX8Nh0ijvMqqn3y30
Via: SIP/2.0/TCP 127.0.1.1:5060;received=10.189.219.4;branch=z9hG4bK-29834-1-2
Contact: <sip:mcptt_c1@127.0.1.1:5060>
Max-Forwards: 68
To: <sip:6505550769@example.com>
From: <sip:6505550769@example.com>;tag=1
Authorization: Digest response="f9fd5bf8eb2811585ba472be81754174", username="6505550769@example.com", realm="example.com", nonce="3b80e3790835ffb2", uri="sip:192.168.1.21:5060", algorithm=MD5, cnonce="6b8b4567", opaque="294ce4e656af89ba", qop=auth, nc=00000001,integrity-protected=ip-assoc-pending
Call-ID: 1-29834@127.0.1.1
CSeq: 2 REGISTER
User-Agent: MCPTT-UA
Allow: INVITE, ACK, BYE, CANCEL, OPTIONS, NOTIFY, SUBSCRIBE, INFO, MESSAGE, REFER
P-Visited-Network-ID: example.com
Content-Length:  0

