FROM blaxterlab/interproscan
LABEL maintainer "rjchallis@gmail.com"

USER root
WORKDIR /interproscan-wrapper

COPY interproscan.sh /interproscan-wrapper
ENV PATH=/interproscan-wrapper:$PATH

RUN adduser --disabled-password --gecos '' dockeruser
RUN chmod -R 777 /interproscan-wrapper

USER dockeruser
