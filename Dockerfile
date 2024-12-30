FROM python AS build

WORKDIR /workdir

RUN pip install mkdocs mkdocs-material mkdocs-with-pdf

COPY mkdocs.yaml mkdocs.yaml
COPY docs docs

RUN mkdocs build

FROM nginx:1.27.3-alpine-slim

COPY --from=build /workdir/site /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
