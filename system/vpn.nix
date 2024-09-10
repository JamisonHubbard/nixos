{
    pkgs,
    ...
}: {
    networking.wg-quick.interfaces = let
        server_ip = "149.88.22.129";
    in {
        wg0 = {
            address = [
                "10.65.212.214/32"
                "fc00:bbbb:bbbb:bb01::2:d4d5/128"
            ];

            listenPort = 51820;

            privateKeyFile = "/etc/mullvad-vpn.key";

            peers = [{
                publicKey = "yxyntWsANEwxeR0pOPNAcfWY7zEVICZe9G+GxortzEY=";
                allowedIPs = [ "0.0.0.0/0" ];
                endpoint = "${server_ip}:51820";
                persistentKeepalive = 25;
            }];

            postUp = ''
                # Mark packets on the wg0 interface
                wg set wg0 fwmark 51820

                # Forbid anything else which doesn't go through wireguard VPN on
                # ipV4 and ipV6
                ${pkgs.iptables}/bin/iptables -A OUTPUT \
                    ! -d 192.168.0.0/16 \
                    ! -o wg0 \
                    -m mark ! --mark $(wg show wg0 fwmark) \
                    -m addrtype ! --dst-type LOCAL \
                    -j REJECT
                ${pkgs.iptables}/bin/ip6tables -A OUTPUT \
                    ! -o wg0 \
                    -m mark ! --mark $(wg show wg0 fwmark) \
                    -m addrtype ! --dst-type LOCAL \
                    -j REJECT
            '';

            postDown = ''
                ${pkgs.iptables}/bin/iptables -D OUTPUT \
                    ! -o wg0 \
                    -m mark ! --mark $(wg show wg0 fwmark) \
                    -m addrtype ! --dst-type LOCAL \
                    -j REJECT
                ${pkgs.iptables}/bin/ip6tables -D OUTPUT \
                    ! -o wg0 -m mark \
                    ! --mark $(wg show wg0 fwmark) \
                    -m addrtype ! --dst-type LOCAL \
                    -j REJECT
            '';
        };
    };
}
