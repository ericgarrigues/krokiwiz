FROM python:3.10-alpine

RUN apk add poetry

ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

ENV VIRTUAL_ENV=/app/.venv \
    PATH="/app/.venv/bin:$PATH"

WORKDIR /app

COPY poetry.lock ./poetry.lock
COPY pyproject.toml ./pyproject.toml
COPY krokiwiz.py ./krokiwiz.py

RUN poetry install && rm -rf $POETRY_CACHE_DIR

ENTRYPOINT ["poetry", "run", "./krokiwiz.py"]



