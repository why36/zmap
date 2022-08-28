for i in {5..24..1}
do
	target="/root/data/hongyu_0811/targets/34_160_0_0.ips2"
	rate=861	# 1 rtt every 10 seconds
	# rate=2955	# 1 rtt every 10 seconds
	time=3600
	which=${i}

	per_ip=1
	batch=1
	coolTime=5
	sender_threads=1

	path="/root/data/hongyu_0811/1_rtt"
	output_file="$path/rtt_$which"
	status_file="$path/status_$which"
	log_file="$path/log_$which"
	error_file="$path/error_$which"
	metadata_file="$path/metadata_$which"

	sudo ./zmap 	-w $target -v 3 -M icmp_echo_time -r $rate -P $per_ip -t $time --batch=$batch -c $coolTime --sender-threads=$sender_threads	 -l $log_file -u $status_file --output-file=$output_file --output-module=csv --output-fields="saddr,type,ttl,icmp_id,seq,cksum,sent_timestamp_ts,sent_timestamp_us,timestamp_ts,timestamp_us" --metadata-file=$metadata_file
done
