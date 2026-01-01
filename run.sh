#!/bin/bash

# install expect if not present
if ! command -v expect >/dev/null 2>&1; then
    apt update -y && apt install -y expect
fi

cat << 'EOF' > /tmp/auto.exp
#!/usr/bin/expect -f
set timeout -1

while {1} {

    spawn bash -c "bash <(curl -s https://vps1.jishnu.fun)"

    sleep 5
    send "3\r"

    sleep 5
    send "2\r"

    sleep 5
    send "1\r"

    sleep 120

    send "\r"
    sleep 1
    send "\r"
    sleep 1
    send "\r"

    sleep 3
    send "root\r"

    sleep 3
    send "root\r"

    sleep 5
}
EOF

chmod +x /tmp/auto.exp
/tmp/auto.exp
