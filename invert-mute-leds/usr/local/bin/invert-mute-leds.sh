#!/bin/bash
# Inverts ThinkPad mute LEDs: ON when unmuted, OFF when muted.
# Handles both speaker (platform::mute) and mic (platform::micmute).

SINK_LED="/sys/devices/platform/thinkpad_acpi/leds/platform::mute/brightness"
SOURCE_LED="/sys/devices/platform/thinkpad_acpi/leds/platform::micmute/brightness"

update_sink_led() {
    local muted
    muted=$(pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null | awk '{print $2}')
    if [ "$muted" = "yes" ]; then
        echo 0 > "$SINK_LED"
    else
        echo 1 > "$SINK_LED"
    fi
}

update_source_led() {
    local muted
    muted=$(pactl get-source-mute @DEFAULT_SOURCE@ 2>/dev/null | awk '{print $2}')
    if [ "$muted" = "yes" ]; then
        echo 0 > "$SOURCE_LED"
    else
        echo 1 > "$SOURCE_LED"
    fi
}

# Set initial state on startup
update_sink_led
update_source_led

# Listen for changes and update accordingly
pactl subscribe | grep --line-buffered "Event 'change' on " | while read -r line; do
    case "$line" in
        *sink*)
            update_sink_led
            ;;
        *source*)
            update_source_led
            ;;
    esac
done
