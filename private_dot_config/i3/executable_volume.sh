#!/bin/bash

set -eux

SINK="@DEFAULT_SINK@"
SET_SINK_VOLUME="pactl set-sink-volume $SINK"
SET_SINK_MUTE="pactl set-sink-mute $SINK"

case $1 in
	up)
		$SET_SINK_VOLUME +5%
		;;

	down)
		$SET_SINK_VOLUME -5%
		;;

	toggle)
		$SET_SINK_MUTE toggle
		;;

	max)
		$SET_SINK_VOLUME 100%
		;;
esac

