rateArray=("21000" "21000" "21000" "21000")
whichs=("11" "21" "12" "22")
targets=("ips_11" "ips_21" "ips_11" "ips_21")
for i in 0 1 2 3
do
	target=${targets[$i]}
	rate=${rateArray[$i]}
	which=${whichs[$i]}
	per_ip=1
	batch=1
	coolTime=15
	sender_threads=1

	path="/root/data/server_0404/stage2"
	output_file="$path/rtt_$which"
	status_file="$path/status_$which"
	log_file="$path/log_$which"
	error_file="$path/error_$which"
	metadata_file="$path/metadata_$which"

	sudo ./zmap 	-w $target -v 3 -M icmp_echo_time -r $rate -P $per_ip --batch=$batch -c $coolTime --sender-threads=$sender_threads	 -l $log_file -u $status_file --output-file=$output_file --output-module=csv --output-fields="saddr,type,code,sent_timestamp_ts,sent_timestamp_us,timestamp_ts,timestamp_us" --metadata-file=$metadata_file > $error_file
done














