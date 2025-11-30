#!/usr/bin/env bash
set -e

# Add $HOME/bin to PATH
mkdir -p $HOME/bin
export PATH=$HOME/bin:$PATH

# Install kubectl if missing
if ! command -v kubectl &>/dev/null; then
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  chmod +x kubectl
  mv kubectl $HOME/bin/
fi

# Install aws-iam-authenticator if missing
if ! command -v aws-iam-authenticator &>/dev/null; then
  curl -o aws-iam-authenticator "https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/aws-iam-authenticator"
  chmod +x aws-iam-authenticator
  mv aws-iam-authenticator $HOME/bin/
fi

# Verify AWS credentials
aws sts get-caller-identity
