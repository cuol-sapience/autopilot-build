FROM osrf/ros:humble-desktop-full-jammy

RUN useradd -ms /bin/bash worker
RUN usermod -aG sudo worker
RUN passwd -d worker