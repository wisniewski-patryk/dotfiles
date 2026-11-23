#!/usr/bin/env bash
# Workaround test: take Hyprland's main thread OUT of realtime scheduling.
#
# Hyprland gets SCHED_RR via rtkit with RLIMIT_RTTIME 150ms soft / 200ms hard.
# If the main thread burns >200ms of CPU without sleeping (e.g. stuck in the
# i915 eDP panel power code on resume / lid / dock events) the kernel SIGKILLs
# it: no coredump, no crash report, no log -> start-hyprland restarts in safe mode.
# RLIMIT_RTTIME only applies to realtime threads, so with SCHED_OTHER that
# kill cannot happen (worst case Hyprland freezes briefly instead).
#
# Lowering your own process's priority needs no root.
# Run once by hand, or from autostart.lua inside hl.on("hyprland.start", ...):
#     hl.exec_cmd("~/source/playground/hyprland-debug/drop-realtime.sh")
set -uo pipefail

for _ in $(seq 1 20); do              # wait for Hyprland to gain RT first
    pid=$(pgrep -xo Hyprland) && [[ $(awk '{print $41}' /proc/$pid/stat) == 2 ]] && break
    sleep 0.5
done
[[ -n ${pid:-} ]] || { echo "Hyprland not running" >&2; exit 1; }

# -R: rtkit sets SCHED_RESET_ON_FORK, and an unprivileged user may not clear
# that flag -> without -R chrt fails with EPERM. Keep the flag, drop RR.
if chrt -o -R -p 0 "$pid"; then
    echo "Hyprland $pid: $(chrt -p "$pid" | head -1)"
    logger -t hypr-drop-realtime "dropped realtime scheduling of Hyprland $pid"
else
    logger -t hypr-drop-realtime "FAILED to drop realtime scheduling of Hyprland $pid"
    exit 1
fi
