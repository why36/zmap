whichs=("1" "2" "3" "4")
for i in 0 1 2 3
do
	rate=11000
	which="${whichs[$i]}1"
	target="targets_0511/ips_${whichs[$i]}"
	per_ip=30
	batch=1
	coolTime=15
	sender_threads=1

	path="/root/data/server_0511/0_test/index"
	output_file="$path/rtt_$which"
	status_file="$path/status_$which"
	log_file="$path/log_$which"
	error_file="$path/error_$which"
	metadata_file="$path/metadata_$which"

	sudo ./zmap 	-w $target -v 5 -M udp --probe-args=latency:0000 -p 65535  -r $rate -P $per_ip --batch=$batch -c $coolTime --sender-threads=$sender_threads	 -l $log_file -u $status_file --output-file=$output_file --output-module=csv --output-fields="icmp_responder,saddr,icmp_type,icmp_code,icmp_seq,icmp_timestamp,icmp_rtt" --metadata-file=$metadata_file > $error_file

done














