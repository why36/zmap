rateArray=("2200" "66000" "11000" "2200" "66000" "11000")
timeArray=("300" "30" "180" "300" "30" "180")
whichs=("11" "31" "21" "12" "32" "22")
for i in 0 1 2 3 4 5
do
	rate=${rateArray[$i]}
	which="${whichs[$i]}"
	time=${timeArray[$i]}
	for j in 1 2
	do
		target="targets_0511/ips_${j}"
		per_ip=1
		batch=1
		coolTime=15
		sender_threads=1

		path="/root/data/server_0511/2_rates/ips_${j}/time_1"
		sudo mkdir $path

		output_file="$path/rtt_$which"
		status_file="$path/status_$which"
		log_file="$path/log_$which"
		error_file="$path/error_$which"
		metadata_file="$path/metadata_$which"

		sudo ./zmap 	-w $target -v 3 -M udp --probe-args=latency:0000 -p 65535  -r $rate -t $time -P $per_ip --batch=$batch -c $coolTime --sender-threads=$sender_threads	 -l $log_file -u $status_file --output-file=$output_file --output-module=csv --output-fields="icmp_responder,saddr,icmp_type,icmp_code,icmp_timestamp,icmp_rtt" --metadata-file=$metadata_file > $error_file
	done
done














