FROM archlinux:latest
RUN pacman -Sy wget jq --needed --noconfirm --overwrite '*' 
COPY gendb.sh /gendb.sh
ENTRYPOINT ["/gendb.sh"]
