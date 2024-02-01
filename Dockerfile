FROM alpine/git AS base

ARG TAG=latest
RUN git clone https://github.com/0dayCTF/reverse-shell-generator.git && \
    cd reverse-shell-generator && \
    ([[ "$TAG" = "latest" ]] || git checkout ${TAG}) && \
    rm -rf .git

FROM pierrezemb/gostatic

COPY --from=base /git/reverse-shell-generator /srv/http
EXPOSE 8043
