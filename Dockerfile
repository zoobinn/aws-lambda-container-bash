ARG FUNCTION_DIR="/function"
FROM amazon/aws-cli
ARG FUNCTION_DIR
# Install JQ
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && yum -y install jq && yum clean all
# Create function directory
RUN mkdir -p ${FUNCTION_DIR}
COPY ./bootstrap ${FUNCTION_DIR}
COPY ./function.sh ${FUNCTION_DIR}
RUN chmod +x ${FUNCTION_DIR}/bootstrap
RUN chmod +x ${FUNCTION_DIR}/function.sh
ENTRYPOINT ["/function/bootstrap"]
