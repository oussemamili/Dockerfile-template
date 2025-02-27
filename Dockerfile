FROM {{BASE_IMAGE}}

{{#each ENV_VARS}}
ENV {{this.key}}={{this.value}}
{{/each}}

WORKDIR {{WORKDIR}}

{{#each FILES}}
COPY {{this.src}} {{this.dest}}
{{/each}}

RUN {{INSTALL_COMMAND}}

EXPOSE {{PORT}}

CMD [{{CMD}}]
