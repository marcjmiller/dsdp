VERSION 0.6

# Frontend
fe-test:
  RUN yarn test:unit

fe-build-dev-image:
  FROM node:16-alpine
  WORKDIR /app
  ENTRYPOINT ["yarn", "start"]
  SAVE IMAGE frontend:dev-build

# Backend
be-all:
  BUILD +be-format
  BUILD +be-test
  BUILD +be-lint

be-dev-deps:
  FROM python:3.10.4-slim-buster
  WORKDIR /home/python
  ENV PATH=/home/python/.local/bin:$PATH
  ENV PYTHONIOENCODING=UTF-8
  ENV PYTHONDONTWRITEBYTECODE=1
  ENV PYTHONUNBUFFERED=1
  ENV PYTHONPATH=/home/python/app
  ENV PYTHONHASHSEED=random
  ENV PYTHONFAULTHANDLER=1
  COPY ./backend/pyproject.toml ./backend/poetry.lock ./
  RUN pip install --upgrade pip; \
      pip install poetry; \
      poetry config virtualenvs.create false; \
      poetry install --no-interaction --no-ansi;

be-lint:
  LOCALLY
  RUN pylint ./**/*.py

be-format:
  LOCALLY
  RUN python -m black .

be-test:
  LOCALLY
  RUN python -m pytest

be-build-dev-image:
  FROM +be-dev-deps
  COPY ./backend .
  ENTRYPOINT ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0"]
  SAVE IMAGE backend:dev-build

run-dev:
  BUILD +fe-build-dev-image
  BUILD +be-build-dev-image