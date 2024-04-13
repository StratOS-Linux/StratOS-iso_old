function get-IPs
    # Extract the private IP address
    set private_ip (ip -br -c a | tail -n 1 | awk -F '/' '{print $1}' | awk '{print $3}')
    echo "Private: $private_ip"

    # Check for internet connectivity and fetch public IP
    if curl -s --head --request GET www.google.com | grep "200 OK" > /dev/null
        set public_ip (curl -s https://ipinfo.io/ip)
        echo -n "Public: "
	set_color purple
	echo $public_ip
	set_color normal
	
    else
        echo -n "Public: "
	set_color purple
	echo NA
	set_color normal
    end
end
