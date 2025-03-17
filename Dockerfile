{{#if BASE_IMAGE}}
FROM {{BASE_IMAGE}}
{{/if}}

{{#each ENV_VARS}}
  {{#if this.name}}
    {{#if this.value}}
ENV {{this.name}}={{this.value}}
    {{/if}}
  {{/if}}
{{/each}}

{{#each LABELS}}
  {{#if this.key}}
    {{#if this.value}}
LABEL {{this.key}}={{this.value}}
    {{/if}}
  {{/if}}
{{/each}}

{{#if WORKDIR}}
WORKDIR {{WORKDIR}}
{{/if}}

{{#each FILES}}
  {{#if this.hostPath}}
    {{#if this.containerPath}}
COPY {{#if this.option}}{{this.option}}{{/if}} {{this.hostPath}} {{this.containerPath}}
    {{/if}}
  {{/if}}
{{/each}}

{{#each INSTALL_COMMAND}}
  {{#if this.command}}
RUN {{#if this.option}}{{this.option}} {{/if}}{{this.command}}
  {{/if}}
{{/each}}

{{#if USER}}
USER {{USER}}
{{/if}}

{{#each ARGS}}
  {{#if this.name}}
ARG {{this.name}}{{#if this.value}}={{this.value}}{{/if}}
  {{/if}}
{{/each}}

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
