#!/system/bin/sh

# This script is needed to automatically set GUI props for unified sm7125 devices (RMX2170 / RMX2061 / RMX3081)

load_RMX2061()
{
    setprop "fox.status.left.offset" "261";
    setprop "fox.status.height.offset" "132";
    setprop "fox.status.placement.offset" "40";
    setprop "fox.status.right.offset" "34";
    setprop "fox.screen.height" "2400";
    echo "I:GUI-props: using props for realme 6 Pro (RMX2061)" >> $LOGF;
}

load_RMX2170()
{
    setprop "fox.status.left.offset" "158";
    setprop "fox.status.height.offset" "140";
    setprop "fox.status.placement.offset" "40";
    setprop "fox.status.right.offset" "34";
    setprop "fox.screen.height" "2400";
    echo "I:GUI-props: using props for realme 7 Pro (RMX2170)" >> $LOGF;
}

load_RMX3081()
{
    setprop "fox.status.left.offset" "158";
    setprop "fox.status.height.offset" "140";
    setprop "fox.status.placement.offset" "40";
    setprop "fox.status.right.offset" "34";
    setprop "fox.screen.height" "2400";
    echo "I:GUI-props: using props for realme 8 Pro (RMX3081)" >> $LOGF;
}

LOGF=/tmp/recovery.log;
project=$(cat /proc/oppoVersion/prjName 2>/dev/null);
[ -z "$project" ] && project=$(cat /proc/oplusVersion/prjName 2>/dev/null);

case "$project" in
    "20711")
        load_RMX3081
        ;;
    "206B1"|"206b1")
        load_RMX2170
        ;;
    "19721"|*)
        load_RMX2061
        ;;
esac

exit 0
