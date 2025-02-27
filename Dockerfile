# Base image (User selects the base image)
FROM {{BASE_IMAGE}}

# Environment variables (Optional, user-defined)
{% for env_var in ENV_VARS %}
ENV {{env_var.key}}={{env_var.value}}
{% endfor %}

# Set working directory
WORKDIR {{WORKDIR}}

# Copy files into the container (User decides what to copy)
{% for file in FILES %}
COPY {{file.src}} {{file.dest}}
{% endfor %}

# Install dependencies (User can choose package manager)
{% if INSTALL_COMMAND %}
RUN {{INSTALL_COMMAND}}
{% endif %}

# Expose ports (User-defined)
{% for port in EXPOSED_PORTS %}
EXPOSE {{port}}
{% endfor %}

# Run command (User-defined entrypoint or CMD)
{% if ENTRYPOINT %}
ENTRYPOINT [{{ENTRYPOINT}}]
{% endif %}

{% if CMD %}
CMD [{{CMD}}]
{% endif %}
