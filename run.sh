#!/bin/bash

# check expect
if ! command -v expect >/dev/null 2>&1; then
    echo "❌ expect not installed"
    echo "➡ This environment (Google IDX) does not support apt"
    echo "➡ Run this on Ubuntu/Debian VPS"
    exit 1
fi

cat << 'EOF' > /tmp/auto.exp
#!/usr/bin/env expect
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
expect /tmp/auto.exp

