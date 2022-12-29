FROM python:3.9.16-slim-buster

RUN apt-get update \
    && apt-get install -y \
       git vim libyaml-cpp-dev libyaml-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install mlflow

EXPOSE 5001

WORKDIR /mlflow/

ENV BACKEND_URI sqlite:////mlflow/mlflow.db
ENV ARTIFACT_ROOT /mlflow/artifacts

CMD mlflow server \
    --backend-store-uri=${BACKEND_URI} \
    --default-artifact-root=${ARTIFACT_ROOT} \
    --host=0.0.0.0 \
    --port=5001
