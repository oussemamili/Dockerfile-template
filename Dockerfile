FROM {{BASE_IMAGE}}

ENV {{this.key}}={{this.value}}

WORKDIR {{WORKDIR}}

COPY {{this.src}} {{this.dest}}

RUN {{INSTALL_COMMAND}}

EXPOSE {{PORT}}

ENTRYPOINT [{{ENTRYPOINT}}]

CMD [{{CMD}}]
