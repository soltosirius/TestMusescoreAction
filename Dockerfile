FROM ubuntu:latest

# Update package lists
RUN apt-get update

# Install dependencies
RUN apt-get install -y \
    curl \
    libgl1-mesa-glx \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-xinerama0 \
    libxcb-xkb1 \
    libxkbcommon-x11-0 \
    libfontconfig1 \
    libglib2.0-0 \
    libx11-xcb1 \
    libasound2 \
    libjack-jackd2-0 \
    libnss3 \
    libegl1 \
    xvfb

RUN curl -L https://github.com/musescore/MuseScore/releases/download/v3.6.2/MuseScore-3.6.2.548021370-x86_64.AppImage -o /usr/local/bin/mscore && chmod u+x /usr/local/bin/mscore

ENV DISPLAY=:99

CMD xvfb :99 -screen 0 1024x768x16

#RUN xvfb-run ./squashfs-root/AppRun -o "test.pdf" "test.mscz"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

