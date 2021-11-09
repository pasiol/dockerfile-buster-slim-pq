FROM debian:buster-slim
RUN useradd -m pq && \
    mkdir /home/pq/logs /home/pq/output /home/pq/input && \
    chown -R pq:pq /home/pq && \
    apt update && \
    apt install -y ca-certificates && \
    update-ca-certificates 
WORKDIR /home/pq
COPY primusquery .
COPY libgoutils.so .
RUN chmod u+x /home/pq/primusquery
USER pq
ENTRYPOINT ["/home/pq/primusquery"]
CMD ""