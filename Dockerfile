FROM python:3-bullseye

RUN mkdir /data && mkdir /app

WORKDIR /data

COPY requirements.txt /app/

RUN apt-get update && apt-get upgrade -yq

RUN python -m pip install --upgrade pip && \
    pip install -r /app/requirements.txt

COPY . /app/

ENV ASSETS_PATH "/app/assets/partials"

CMD ["python", "/app/main.py"]