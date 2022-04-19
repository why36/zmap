rate=20000	# TBD: as slow as possible
count=1500000	# TBD: the more the better, while taking into account the packet transfering ability
per_ip=1
batch=1		# TBD
coolTime=15
sender_threads=1	# TBD
port_num=65535

which="1"
path="/root/data/sh_0419/global"
output_file="$path/rtt_$which"
status_file="$path/status_$which"
log_file="$path/log_$which"
error_file="$path/error_$which"
metadata_file="$path/metadata_$which"

sudo ./zmap 	-v 5 -M udp --probe-args=hex:01 -r $rate -N $count -P $per_ip --batch=$batch -c $coolTime -p $port_num --sender-threads=$sender_threads	 -l $log_file -u $status_file --output-file=$output_file --output-module=csv --output-fields="icmp_responder,saddr,icmp_type,icmp_code" --metadata-file=$metadata_file > $error_file














