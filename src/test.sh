rate=10000	# TBD: as slow as possible
count=1500000	# TBD: the more the better, while taking into account the packet transfering ability
per_ip=1
batch=1		# TBD
coolTime=15
sender_threads=1	# TBD

which="11"
path="/root/data/server_0404/stage1"
output_file="$path/rtt_$which"
status_file="$path/status_$which"
log_file="$path/log_$which"
error_file="$path/error_$which"
metadata_file="$path/metadata_$which"

sudo ./zmap 	-w networks_11.zmapt -v 5 -M icmp_echo_time -r $rate -N $count -P $per_ip --batch=$batch -c $coolTime --sender-threads=$sender_threads	 -l $log_file -u $status_file --output-file=$output_file --output-module=csv --output-fields="daddr,saddr,saddr_raw,dst_raw,type,code,sent_timestamp_ts,sent_timestamp_us,timestamp_ts,timestamp_us" --metadata-file=$metadata_file > $error_file
















