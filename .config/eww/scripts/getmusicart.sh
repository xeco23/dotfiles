#!/usr/bin/env bash

tmp_dir="/tmp/eww/spotify"
tmp_cover_path=$tmp_dir/cover.png

if [ ! -d $tmp_dir ]; then
	mkdir -p $tmp_dir
fi

artlink="$(playerctl metadata mpris:artUrl | sed -e 's/open.spotify.com/i.scdn.co/g')"

if [ $(playerctl metadata mpris:artUrl) ]; then
	curl -s "$artlink" --output $tmp_cover_path;
else cp ~/.config/eww/images/image.png $tmp_cover_path;
fi
