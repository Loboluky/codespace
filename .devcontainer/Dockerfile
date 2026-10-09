FROM python:3.12-slim-bookworm

COPY --from=ghcr.io/astral-sh/uv:0.12.19 /uv /uvx /usr/local/bin/

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl git \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --create-home --shell /bin/bash --uid 1000 vscode

COPY matplotlibrc /home/vscode/.config/matplotlib/matplotlibrc
RUN chown -R vscode:vscode /home/vscode/.config

ENV UV_PYTHON_DOWNLOADS=never
ENV UV_LINK_MODE=copy
USER vscode
