FROM argoproj/argocd:v1.5.4

USER root
RUN apt-get update && \
    apt-get install -y \
        curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
USER argocd

ENV HELM_PLUGIN="/home/argocd/.helm/plugins"
ENV AWS_REGION=eu-west-1
ARG HELM_S3_VERSION="0.9.2"
ARG S3_PLUGIN_REPO="https://github.com/hypnoglow/helm-s3.git"
RUN mkdir -p ${HELM_PLUGIN}
RUN helm plugin install ${S3_PLUGIN_REPO} --version ${HELM_S3_VERSION}