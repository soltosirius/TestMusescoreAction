#!/bin/sh
set -e

JOB_FILE="$1"

cd /input
ls
# Run MuseScore to convert MSCZ to PDF
mscore --appimage-extract
xvfb-run ./squashfs-root/AppRun -j job.json
