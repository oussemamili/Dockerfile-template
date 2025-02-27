FROM {{BASE_IMAGE}}

ENV {{env_var.key}}={{env_var.value}}

WORKDIR {{WORKDIR}}

COPY {{file.src}} {{file.dest}}

RUN {{INSTALL_COMMAND}}

EXPOSE {{port}}

ENTRYPOINT [{{ENTRYPOINT}}]

CMD [{{CMD}}]
