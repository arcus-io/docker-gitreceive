#!/bin/bash
RECEIVER_URL=${RECEIVER_URL:-}

if [ "$RECEIVER_URL" != "" ]; then
    wget $RECEIVER_URL -O /home/git/receiver --no-check-certificate
else
    cat << EOF > /home/git/receiver
#!/bin/bash
REPOSITORY=\$1
REVISION=\$2
USERNAME=\$3
FINGERPRINT=\$4
CONTENTS=@-

echo "Received \$1 push from \$3"
EOF
fi

/usr/sbin/sshd -D
