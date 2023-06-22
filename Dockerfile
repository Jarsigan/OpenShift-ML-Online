FROM registry.access.redhat.com/ubi8/python-38:latest

RUN mkdir my-model
ENV MODEL_DIR=./my-model
ENV MODEL_FILE=svc_model.model

COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

COPY train.py ./train.py
COPY api.py ./api.py

#USER 1001
EXPOSE 8080

#RUN python3 train.py
ENTRYPOINT python3 api.py
#CMD ["python3", "api.py", "8080"]
