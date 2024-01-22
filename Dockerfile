FROM alpine/git:latest AS build

ARG TAG=-
RUN git clone https://github.com/0dayCTF/reverse-shell-generator.git
WORKDIR reverse-shell-generator
RUN git checkout ${TAG}
RUN rm -rf .git

FROM pierrezemb/gostatic

COPY --from=build /reverse-shell-generator /srv/http
