validate_ip(){
local ip="$1"
local regex="^([0-9]{1,3}\.){3}[0-9]{1,3}$); do
if [[$ip =~ $regex ]]; then	
	if octet in $(echo $ip | tr "." "\n" ); do
		if  ((octet < 0 || octet > 255)); then
			echo "invalid IP: $ip"
			return 1
		fi
	done
	echo "valid ip: $ip"
	return 0
else 
	echo "invalid ip: $ip"
	return 1
fi
}
while read -r host ip _; do
	echo "Host: $host, IP: $ip"
	validate_ip "$ip"
done
