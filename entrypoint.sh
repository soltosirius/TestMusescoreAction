#!/bin/sh
set -e

cd /input/scores

# Run MuseScore to convert MSCZ to PDF
mscore --appimage-extract
xvfb-run ./squashfs-root/AppRun -j job.json
