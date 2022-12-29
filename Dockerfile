FROM python:3.9.16-slim-buster

RUN apt-get update \
    && apt-get install -y \
       git vim libyaml-cpp-dev libyaml-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install \
    psycopg2-binary==2.9.3 \
    mlflow[extras]==1.25.1

ENTRYPOINT ["mlflow", "server"]
