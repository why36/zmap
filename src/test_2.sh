rateArray=("2750" "22000" "5500" "66000" "11000")
whichs=("1" "4" "2" "5" "3")
for i in 0 1 2 3 4
do
	rate=${rateArray[$i]}
	which="1${whichs[$i]}"
	per_ip=1
	batch=1
	coolTime=15
	sender_threads=1

	path="/root/data/server_0506/2_rates"
	output_file="$path/rtt_$which"
	status_file="$path/status_$which"
	log_file="$path/log_$which"
	error_file="$path/error_$which"
	metadata_file="$path/metadata_$which"

	sudo ./zmap 	-w targets/ips_1 -v 3 -M icmp_echo_time -r $rate -P $per_ip --batch=$batch -c $coolTime --sender-threads=$sender_threads	 -l $log_file -u $status_file --output-file=$output_file --output-module=csv --output-fields="saddr,type,code,sent_timestamp_ts,sent_timestamp_us,timestamp_ts,timestamp_us" --metadata-file=$metadata_file > $error_file

	rate=${rateArray[$i]}
	which="2${whichs[$i]}"
	per_ip=1
	batch=1
	coolTime=15
	sender_threads=1

	path="/root/data/server_0506/2_rates"
	output_file="$path/rtt_$which"
	status_file="$path/status_$which"
	log_file="$path/log_$which"
	error_file="$path/error_$which"
	metadata_file="$path/metadata_$which"

	sudo ./zmap 	-w targets/ips_2 -v 3 -M icmp_echo_time -r $rate -P $per_ip --batch=$batch -c $coolTime --sender-threads=$sender_threads	 -l $log_file -u $status_file --output-file=$output_file --output-module=csv --output-fields="saddr,type,code,sent_timestamp_ts,sent_timestamp_us,timestamp_ts,timestamp_us" --metadata-file=$metadata_file > $error_file
done














