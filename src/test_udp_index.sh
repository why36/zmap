rate=200
per_ip=16		#200 in the formal test
which="3"
target="targets_0616/ips_1"
batch=1
coolTime=15
sender_threads=1

path="/root/data/server_0616/0_tests/"
output_file="$path/rtt_$which"
status_file="$path/status_$which"
log_file="$path/log_$which"
error_file="$path/error_$which"
metadata_file="$path/metadata_$which"

sudo ./zmap     -w $target -v 5 -M udp --probe-args=latency:0000 -p 65535  -r $rate -P $per_ip --batch=$batch -c $coolTime --sender-threads=$sender_threads      -l $log_file -u $status_file --output-file=$output_file --output-module=csv --output-fields="icmp_responder,saddr,saddr_raw,icmp_type,icmp_code,icmp_round,icmp_path,icmp_timestamp,icmp_rtt" --metadata-file=$metadata_file > $error_file
