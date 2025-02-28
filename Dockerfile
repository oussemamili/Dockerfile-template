{{#if BASE_IMAGE}}
FROM {{BASE_IMAGE}}
{{/if}}

{{#if ENV_VARS}}
{{#each ENV_VARS}}
ENV {{this.key}}={{this.value}}
{{/each}}
{{/if}}

{{#if WORKDIR}}
WORKDIR {{WORKDIR}}
{{/if}}

{{#if FILES}}
{{#each FILES}}
COPY {{this.src}} {{this.dest}}
{{/each}}
{{/if}}

{{#if INSTALL_COMMAND}}
RUN {{INSTALL_COMMAND}}
{{/if}}

{{#if PORT}}
EXPOSE {{PORT}}
{{/if}}

{{#if ENTRYPOINT}}
ENTRYPOINT [{{ENTRYPOINT}}]
{{/if}}

{{#if CMD}}
CMD [{{CMD}}]
{{/if}}
