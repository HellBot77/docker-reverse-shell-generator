FROM alpine/git AS build

ARG TAG=-
RUN git clone https://github.com/0dayCTF/reverse-shell-generator.git && \
    cd reverse-shell-generator && \
    git checkout ${TAG} && \
    rm -rf .git

FROM pierrezemb/gostatic

COPY --from=build /git/reverse-shell-generator /srv/http
EXPOSE 8043
