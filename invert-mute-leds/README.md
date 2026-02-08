# Revert mute leds behavior

On my Thinkpad laptop, by default, the `mute` and `mic-mute` Fn keys
(F1 and F4 respectively),
would have their leds enabled when the system is in muted state.

However, I'm setting my speaker and mic on mute most of the time,
so it is equal to having the leds always on, which is very annoying.

The configurations under this folder will invert this behavior:
 leds off when mute and on when un-muted.

Notes: my laptop model is Thinkpad X1 Carbon Gen 6,
but I believe this would apply to all models as well.

Issues:

- The enable-invert-mute-leds.service needs to be manually copied
 to /etc/systemd/system. If used symlink, at boot time, as /home is not mounted
 the system cannot follow the symlink into the actual file.
- Looks like the builtin speaker was tied to platform::mute/brightness,
 it might be a hardward mute function via the embedded controller.
