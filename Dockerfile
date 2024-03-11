FROM alpine/git AS base

ARG TAG=latest
RUN git clone https://github.com/0dayCTF/reverse-shell-generator.git && \
    cd reverse-shell-generator && \
    ([[ "$TAG" = "latest" ]] || git checkout ${TAG}) && \
    rm -rf .git

FROM lipanski/docker-static-website

COPY --from=base /git/reverse-shell-generator .
