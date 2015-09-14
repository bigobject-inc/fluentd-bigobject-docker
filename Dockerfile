FROM fluent/fluentd:latest
LABEL Description="Fluentd BigObject docker image" Vendor="BigObject" Version="1.0"

USER ubuntu
WORKDIR /home/ubuntu
ENV PATH /home/ubuntu/ruby/bin:$PATH

RUN mkdir -p /fluentd/input
COPY input/* /fluentd/input/

#RUN gem install fluent-plugin-secure-forward
RUN gem install rest-client
RUN gem install json

EXPOSE 24284
CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
