#!/system/bin/sh

# This script is needed to automatically set GUI props for unified devices.
load_sm7125()
{
    setprop "fox.status.right.offset" "34"
    setprop "fox.screen.height" "2400"
}

load_RMX2061()
{
    local left=261
    setprop "fox.status.left.offset" "$left"
    setprop "fox.status.height.offset" "108"
    setprop "fox.status.placement.offset" "38"
    sed -i "s/%status_indent_left%/$left/g" /twres/pages/templates/statusbar.xml 2>/dev/null
    sed -i "s/placement x=\"[0-9]*\" y=\"%status_info_y%\"/placement x=\"$left\" y=\"%status_info_y%\"/g" /twres/pages/templates/statusbar.xml 2>/dev/null
    echo "I:GUI-props: using props for" $project >> $LOGF
}

load_RMX2170()
{
    local left=158
    setprop "fox.status.left.offset" "$left"
    setprop "fox.status.height.offset" "140"
    setprop "fox.status.placement.offset" "40"
    sed -i "s/%status_indent_left%/$left/g" /twres/pages/templates/statusbar.xml 2>/dev/null
    sed -i "s/placement x=\"[0-9]*\" y=\"%status_info_y%\"/placement x=\"$left\" y=\"%status_info_y%\"/g" /twres/pages/templates/statusbar.xml 2>/dev/null
    echo "I:GUI-props: using props for" $project >> $LOGF
}

load_RMX3081()
{
    local left=158
    setprop "fox.status.left.offset" "$left"
    setprop "fox.status.height.offset" "140"
    setprop "fox.status.placement.offset" "40"
    sed -i "s/%status_indent_left%/$left/g" /twres/pages/templates/statusbar.xml 2>/dev/null
    sed -i "s/placement x=\"[0-9]*\" y=\"%status_info_y%\"/placement x=\"$left\" y=\"%status_info_y%\"/g" /twres/pages/templates/statusbar.xml 2>/dev/null
    echo "I:GUI-props: using props for" $project >> $LOGF
}

LOGF=/tmp/recovery.log
project=$(cat /proc/oppoVersion/prjName 2>/dev/null | tr -d '\r\n ')
[ -z "$project" ] && project=$(cat /proc/oplusVersion/prjName 2>/dev/null | tr -d '\r\n ')

case $project in
    "20711")
        load_RMX3081
        ;;
    "206B1"|"206b1")
        load_RMX2170
        ;;
    "19721")
        load_RMX2061
        ;;
    *)
        dev=$(getprop ro.product.device)
        case "$dev" in
            "RMX3081") load_RMX3081 ;;
            "RMX2170") load_RMX2170 ;;
            "RMX2061"|"RMX2063") load_RMX2061 ;;
            *) echo "E:GUI-props: unsupported project:" $project >> $LOGF ;;
        esac
        ;;
esac

load_sm7125

exit 0
