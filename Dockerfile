FROM python:3.11.13-slim

RUN mkdir -p /app
COPY . main.py /app/
WORKDIR /app
RUN pip install -r requirements.txt
RUN python -m textblob.download_corpora
RUN python post-install.py
EXPOSE 8080
CMD [ "main.py" ]
ENTRYPOINT [ "python" ]