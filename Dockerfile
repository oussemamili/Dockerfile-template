{{#if BASE_IMAGE}}
FROM {{BASE_IMAGE}}
{{/if}}

{{#if ENV_VARS}}
{{#each ENV_VARS}}
ENV {{this.name}}={{this.value}}
{{/each}}
{{/if}}

{{#if LABELS}}
{{#each LABELS}}
LABEL {{this.key}}={{this.value}}
{{/each}}
{{/if}}

{{#if WORKDIR}}
WORKDIR {{WORKDIR}}
{{/if}}

{{#if FILES}}
{{#each FILES}}
COPY {{#if this.option}}{{this.option}}{{/if}} {{this.hostPath}} {{this.containerPath}}
{{/each}}
{{/if}}

{{#if INSTALL_COMMAND}}
RUN {{#if this.option}}{{this.option}}{{/if}} {{INSTALL_COMMAND}}
{{/if}}

{{#if USER}}
USER {{USER}}
{{/if}}

{{#if ARGS}}
{{#each ARGS}}
ARG {{this.name}}{{#if this.value}}={{this.value}}{{/if}}
{{/each}}
{{/if}}

{{#if VOLUME}}
VOLUME {{VOLUME}}
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
