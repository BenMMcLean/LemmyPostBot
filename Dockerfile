FROM python:3.11-slim as base

ENV PYTHONUNBUFFERED=1

RUN apt update \
    && apt install -yqq wget git gnupg curl python3-pip
RUN pip3 install pipenv

# Copy source files
COPY . /app
WORKDIR /app
RUN pipenv install --system --deploy --ignore-pipfile

CMD ["python", "./main.py"]
