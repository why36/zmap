#nohup ./zmap 45.79.0.0/16  -M udp --probe-args=latency:0000 -p 53 -r 1000 -t 1500  -c 5 -o result_us_220.csv --output-fields="icmp_responder,saddr,icmp_type,icmp_code,icmp_timestamp,icmp_rtt, origin_ttl" &

#nohup ./zmap 104.64.0.0/16  -M udp --probe-args=latency:0000 -p 53 -r 5000 -t 265  -c 5 -o result_us_36_1.csv -i eth0 --output-fields="icmp_responder,saddr,icmp_type,icmp_code,icmp_timestamp,icmp_rtt, origin_ttl" &

./zmap 104.64.0.0/16  -M udp --probe-args=latency:0000 -p 53 -r 5000 -t 265  -c 5 -o result_us_38_2.csv -i eth0 --output-fields="icmp_responder,saddr,icmp_type,icmp_code,icmp_timestamp,icmp_rtt, origin_ttl" 
