FROM ubuntu:20.04 as build

ENV DEBIAN_FRONTEND noninteractive

ARG TERRAFORM_VERSION
ENV TERRAFORM_VERSION=$TERRAFORM_VERSION

ARG TERRAGRUNT_VERSION
ENV TERRAGRUNT_VERSION=$TERRAGRUNT_VERSION

RUN set -x && \
  apt-get update && \
  apt-get install -y \
  apt-transport-https \
  ca-certificates \
  wget \
  unzip && \
  wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && \
  chmod +x /usr/local/bin/terraform && \
  which terraform && \
  terraform -v && \
  wget https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 && \
  mv terragrunt_linux_amd64 /usr/local/bin/terragrunt && \
  chmod +x /usr/local/bin/terragrunt && \
  which terragrunt && \
  terragrunt -v

FROM ubuntu:20.04

COPY --from=build /usr/local/bin/terraform /usr/local/bin/terraform
COPY --from=build /usr/local/bin/terragrunt /usr/local/bin/terragrunt

RUN set -x && \
  chmod +x /usr/local/bin/terra* && \
  terraform -v && \
  terragrunt -v

CMD ["bash"]