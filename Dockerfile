#FROM debian:wheezy
#ADD ./consoleapp console
#CMD [ "./console" ]

# Much smaller...`
FROM progrium/busybox
RUN opkg-install libc-dev
ADD ./consoleapp console
CMD [ "./console" ]
