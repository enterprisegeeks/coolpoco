#!/bin/bash

# read external variables.
. ./punch.inc
SERVER="https://p.$PUNCH_SERVER"
COMPANY="$PUNCH_COMPANY_NAME"

# define local variables.
SESSION_FILE=/tmp/punch.session
USER_AGENT="User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36"
#USE_PROXY="-k -x http://192.168.56.1:8888/"
USE_PROXY=""


USAGE() {
    cat <<__EOF__

Usage: ./punch.sh <username> <password> [in|out]
This script is PUNCH POST for punch in or punch out.
 punch in ): ./punch.sh username passw0rd in
 punch out): ./punch.sh username passw0rd out

__EOF__
}

if [ $# -ne 3 ]; then
    USAGE
    exit 1
fi

USER=$1
PASS=$2
INOUT=$3
echo 'User  :['$USER']'
echo 'Pass  :['$PASS']'
echo 'PUNCH :['$INOUT']'

# GET TOKEN
TOKEN=`curl -c $SESSION_FILE -s $SERVER/$COMPANY/login $USE_PROXY | egrep -o '[a-zA-Z0-9+/]{43}='`
echo 'Token :['$TOKEN']'

if [ "`echo $TOKEN`" == "" ]; then
    echo "ERROR! Could not get TOKEN."
    exit 1
fi

# LOGIN
PAGE=`
curl -Ss -b $SESSION_FILE -c $SESSION_FILE -X POST \
     -H "$USER_AGENT" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -H "Referer: $SERVER/$COMPANY/login" \
     -d 'utf8=%E2%9C%93&Submit=%E3%83%AD%E3%82%B0%E3%82%A4%E3%83%B3' \
     --data-urlencode "user%5Blogin_id%5D=$USER" \
     --data-urlencode "user%5Bpassword%5D=$PASS" \
     --data-urlencode "authenticity_token=$TOKEN" \
     $SERVER/$COMPANY/login $USE_PROXY \
`

#echo $PAGE
if [ "`echo $PAGE | grep login`" ]; then
    echo "ERROR! Not Logged in. try again."
    exit 1
fi

PUNCH() {
    SID_CODE=$1
    curl -Ss -b $SESSION_FILE -c $SESSION_FILE \
         -H "$USER_AGENT" \
         -H "Referer: $SERVER/timestamp" \
         -H "X-Requested-With: XMLHttpRequest" \
         "$SERVER/stamping?sid=$SID_CODE&lat=&lng=&position_disabled=0" $USE_PROXY
}


if [ $INOUT == "in" ]; then
    PUNCH 1
    echo -e "\npunch done!"
    exit 0
fi

if [ $INOUT == "out" ]; then
    PUNCH 2
    echo -e "\npunch done!"
    exit 0
fi

USAGE
exit 1


