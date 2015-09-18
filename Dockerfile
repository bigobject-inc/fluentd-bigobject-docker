FROM fluent/fluentd:latest
LABEL Description="Fluentd BigObject docker image" Vendor="BigObject" Version="1.0"

USER ubuntu
WORKDIR /home/ubuntu
ENV PATH /home/ubuntu/ruby/bin:$PATH

RUN mkdir -p /fluentd/input
COPY input/* /fluentd/input/

RUN gem install fluent-plugin-bigobject --no-document
RUN gem install rest-client --no-document 
RUN gem install json --no-document

CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
