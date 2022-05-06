rateArray=("9572" "9572" "9572")
whichs=("11" "12" "13")
targets=("ips_11" "ips_11" "ips_11")
for i in 1 2
do
	target=${targets[$i]}
	rate=${rateArray[$i]}
	which=${whichs[$i]}
	per_ip=1
	batch=1
	coolTime=15
	sender_threads=1
	port=65535

	path="/root/data/sh_0419/selected"
	output_file="$path/rtt_$which"
	status_file="$path/status_$which"
	log_file="$path/log_$which"
	error_file="$path/error_$which"
	metadata_file="$path/metadata_$which"

	sudo ./zmap 	-w $target -v 3 -M udp --probe-args=hex:01 -p $port -r $rate -P $per_ip --batch=$batch -c $coolTime --sender-threads=$sender_threads	 -l $log_file -u $status_file --output-file=$output_file --output-module=csv --output-fields="icmp_responder,saddr,icmp_type,icmp_code" --metadata-file=$metadata_file > $error_file
done














