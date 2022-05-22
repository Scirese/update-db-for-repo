FROM archlinux:latest
RUN pacman -Sy wget jq curl --needed --noconfirm --overwrite '*' 
COPY gendb.sh /gendb.sh
ENTRYPOINT ["/gendb.sh"]
