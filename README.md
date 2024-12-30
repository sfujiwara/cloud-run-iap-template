# Cloud Run and Identity Aware Proxy

This repository is a minimal template of Cloud Run and Identity Aware Proxy.
In this template, we host a static HTML generated with [MkDocs](https://www.mkdocs.org/).

## 1. OAuth 2.0

You need to create OAuth consent screen and client ID for the IAP to work.

- Create OAuth consent screen
- Create OAuth client ID

## 2. Configuration

Create `config.mk` same as [`config_example.mk`](config_example.mk).

## 3. Terraform

Deploy Google Cloud resources with the command below.

```shell
make terraform-apply CONFIG=config.mk
```

## 4. NS Record

Fix your domain to use Google's name servers.

## 5. Deploy Docker Image

### Build and Push Docker Image to Artifact Registry

```shell
make cloud-build CONFIG=config.mk
```

### Deploy Docker Image to Cloud Run

```shell
make cloud-run CONFIG=config.mk
```
