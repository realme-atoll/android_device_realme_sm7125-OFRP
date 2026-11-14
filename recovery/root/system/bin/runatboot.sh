#!/system/bin/sh

# Identify the handset on the unified sm7125 target and set its recovery UI position.
LOGF=/tmp/recovery.log
project=$(cat /proc/oppoVersion/prjName 2>/dev/null | tr -d '\r\n ')
[ -z "$project" ] && project=$(cat /proc/oplusVersion/prjName 2>/dev/null | tr -d '\r\n ')

# Device-specific recovery products provide ro.product.device as a fallback;
# the shared sm7125 product relies on the hardware project ID above.
case "$project" in
    20711)
        device=RMX3081
        model="realme 8 Pro"
        ui_position=158
        ;;
    206B1|206b1)
        device=RMX2170
        model="realme 7 Pro"
        ui_position=158
        ;;
    19721)
        device=RMX2061
        model="realme 6 Pro"
        ui_position=261
        ;;
    *)
        case "$(getprop ro.product.device)" in
            RMX3081)
                device=RMX3081
                model="realme 8 Pro"
                ui_position=158
                ;;
            RMX2170)
                device=RMX2170
                model="realme 7 Pro"
                ui_position=158
                ;;
            RMX2061|RMX2063)
                device=RMX2061
                model="realme 6 Pro"
                ui_position=261
                ;;
            *)
                echo "W:device-detect: unknown project '$project' and product '$(getprop ro.product.device)'; keeping build defaults" >> "$LOGF"
                exit 0
                ;;
        esac
        ;;
esac

if [ -n "$project" ]; then
    resetprop ro.separate.soft "$project"
fi
resetprop ro.product.model "$model"
resetprop ro.product.name "$device"
resetprop ro.build.product "$device"
resetprop ro.product.device "$device"
resetprop ro.product.product.device "$device"
resetprop ro.vendor.product.device "$device"
resetprop ro.product.vendor.device "$device"
resetprop ro.product.system.device "$device"
resetprop ro.product.system_ext.device "$device"
resetprop ro.product.odm.device "$device"
echo "I:device-detect: $model ($device), UI position $ui_position" >> "$LOGF"

# Set the left status-bar inset for the detected device model.
statusbar_xml=/twres/pages/templates/statusbar.xml
if [ -e "$statusbar_xml" ]; then
    if [ -w "$statusbar_xml" ]; then
        sed -i "s/%status_indent_left%/$ui_position/g" "$statusbar_xml"
    else
        echo "W:device-detect: cannot update $statusbar_xml" >> "$LOGF"
    fi
fi

# Copy Android-version properties from the installed ROM when its build.prop
# is available. This keeps recovery tools aligned with the installed system.
rom_build_prop=""
for prop_path in /system/build.prop /system_root/build.prop /system/system/build.prop /vendor/build.prop /data/system/build.prop /data/property/persistent.prop; do
    if [ -f "$prop_path" ]; then
        rom_build_prop=$prop_path
        break
    fi
done
if [ -n "$rom_build_prop" ]; then
    for key in \
        ro.build.version.sdk \
        ro.build.version.release \
        ro.build.version.codename \
        ro.build.version.preview_sdk \
        ro.build.version.security_patch \
        ro.build.display.id; do
        value=$(sed -n "s/^${key}=//p" "$rom_build_prop" | head -n 1)
        if [ -n "$value" ]; then
            resetprop "$key" "$value"
        fi
    done
else
    echo "W:version-detect: ROM build.prop not found" >> "$LOGF"
fi

# Mount the custom partition before OrangeFox loads its settings from /custom/Fox.
if [ -e "$statusbar_xml" ]; then
    custom_dev=/dev/block/bootdevice/by-name/custom
    if [ ! -e "$custom_dev" ]; then
        custom_dev=/dev/block/platform/soc/1d84000.ufshc/by-name/custom
    fi
    if [ -e "$custom_dev" ]; then
        mkdir -p /custom
        if ! grep -q '[[:space:]]/custom[[:space:]]' /proc/mounts; then
            mount -t ext4 -o rw "$custom_dev" /custom 2>>"$LOGF"
        fi
    fi
fi

exit 0
