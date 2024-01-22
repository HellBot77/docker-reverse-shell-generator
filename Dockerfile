FROM alpine/git:latest AS build

ARG TAG=-
RUN git clone https://github.com/0dayCTF/reverse-shell-generator.git &&
    git -C=reverse-shell-generator checkout ${TAG} &&
    rm -rf reverse-shell-generator/.git

FROM pierrezemb/gostatic

COPY --from=build /reverse-shell-generator /srv/http
