FROM {{BASE_IMAGE}}

{{#each ENV_VARS}}
ENV {{this}}
{{/each}}

WORKDIR {{WORKDIR}}

{{#each FILES}}
COPY {{this}}
{{/each}}

RUN {{INSTALL_COMMAND}}

EXPOSE {{PORT}}

ENTRYPOINT [{{ENTRYPOINT}}]

CMD [{{CMD}}]
