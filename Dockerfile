FROM alpine/git AS build

ARG TAG=-
RUN git clone https://github.com/0dayCTF/reverse-shell-generator.git && \
    git -C=reverse-shell-generator checkout ${TAG} && \
    rm -rf reverse-shell-generator/.git

FROM pierrezemb/gostatic

COPY --from=build /git/reverse-shell-generator /srv/http
EXPOSE 8043
