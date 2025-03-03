{{#if BASE_IMAGE}}
FROM {{BASE_IMAGE}}
{{/if}}

{{#if ENV_VARS}}
ENV {{ENV_VARS}}
{{/if}}

{{#if WORKDIR}}
WORKDIR {{WORKDIR}}
{{/if}}

{{#if FILES}}
{{#each FILES}}
COPY {{this.hostPath}} {{this.containerPath}}
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
