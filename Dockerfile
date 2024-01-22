FROM alpine:latest AS build

ARG TAG=-
RUN apk add git
RUN git clone https://github.com/0dayCTF/reverse-shell-generator.git
WORKDIR reverse-shell-generator
RUN git checkout ${TAG}

FROM pierrezemb/gostatic

COPY --from=build /reverse-shell-generator /srv/http
