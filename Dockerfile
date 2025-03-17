{{#if BASE_IMAGE}}
FROM {{BASE_IMAGE}}
{{/if}}

{{#each ENV_VARS}}
  {{#if (and this.name this.value)}}
ENV {{this.name}}={{this.value}}
  {{/if}}
{{/each}}

{{#each LABELS}}
  {{#if (and this.key this.value)}}
LABEL {{this.key}}={{this.value}}
  {{/if}}
{{/each}}

{{#if WORKDIR}}
WORKDIR {{WORKDIR}}
{{/if}}

{{#each FILES}}
  {{#if (and this.hostPath this.containerPath)}}
COPY {{#if this.option}}{{this.option}}{{/if}} {{this.hostPath}} {{this.containerPath}}
  {{/if}}
{{/each}}

{{#if INSTALL_COMMAND}}
{{#each INSTALL_COMMAND}}
RUN {{#if this.option}}{{this.option}}{{/if}} {{this.command}}
{{/each}}
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
