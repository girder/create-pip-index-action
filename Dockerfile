FROM python:3.8-slim
WORKDIR /action
COPY make_index.py /action
ENTRYPOINT ["python", "/action/make_index.py"]
