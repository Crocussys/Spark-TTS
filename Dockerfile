FROM python:3.12.10-slim
LABEL authors="Crocussys"

ARG cuda_version=118

WORKDIR /usr/src/app

COPY requirements${cuda_version}.txt ./
RUN apt-get update && apt-get upgrade -y && apt-get clean
RUN pip install --no-cache-dir -r requirements${cuda_version}.txt

COPY . .
CMD [ "python", "./docker_run.py" ]
