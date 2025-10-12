#!/bin/bash

set -eux

SINK="@DEFAULT_AUDIO_SINK@"
SET_SINK_VOLUME="wpctl set-volume -l 1.5 $SINK"
SET_SINK_MUTE="wpctl set-mute $SINK"
SOURCE="@DEFAULT_AUDIO_SOURCE@"
SET_SOURCE_MUTE="wpctl set-mute $SOURCE"

case $1 in
	up)
		$SET_SINK_VOLUME 5%+
		;;

	down)
		$SET_SINK_VOLUME 5%-
		;;

	toggle)
		$SET_SINK_MUTE toggle
		;;

	mic)
		$SET_SOURCE_MUTE toggle
		;;

	max)
		$SET_SINK_VOLUME 100%
		;;
esac

