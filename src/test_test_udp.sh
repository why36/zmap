rateArray=("2000" "2000")
whichs=("4" "5")
for i in 0 1
do
	rate=${rateArray[$i]}
	which="${whichs[$i]}"
	per_ip=2
	batch=1
	coolTime=15
	sender_threads=1

	path="/root/data/server_0511/0_test"
	output_file="$path/rtt_$which"
	status_file="$path/status_$which"
	log_file="$path/log_$which"
	error_file="$path/error_$which"
	metadata_file="$path/metadata_$which"

	sudo ./zmap 	-w targets_0511/1.all_responsive -v 3 -M udp --probe-args=latency:0000 -p 65535  -r $rate -P $per_ip --batch=$batch -c $coolTime --sender-threads=$sender_threads	 -l $log_file -u $status_file --output-file=$output_file --output-module=csv --output-fields="icmp_responder,saddr,icmp_type,icmp_code,icmp_timestamp,icmp_rtt" --metadata-file=$metadata_file > $error_file

done














