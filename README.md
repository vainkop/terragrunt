# A Docker container with Terraform v1.0.1 & Terragrunt v0.31.0 suitable for CI/CD

```bash
docker build \
  --build-arg TERRAFORM_VERSION=1.0.1 \
  --build-arg TERRAGRUNT_VERSION=0.31.0 \
  -t vainkop/terragrunt:0.31.0 \
  -t vainkop/terragrunt:latest . && \
docker push vainkop/terragrunt:0.31.0 && \
docker push vainkop/terragrunt:latest
```
[https://hub.docker.com/r/vainkop/terragrunt](https://hub.docker.com/r/vainkop/terragrunt)  
[https://github.com/vainkop/terragrunt](https://github.com/vainkop/terragrunt)