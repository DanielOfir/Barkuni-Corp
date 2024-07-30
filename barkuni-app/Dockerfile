FROM python:3.9-slim

WORKDIR /app

COPY . /app

RUN pip3 install --no-cache-dir -r /app/requirements.txt

EXPOSE 5000

ENV FLASK_APP run.py

CMD ["flask", "run", "--host=0.0.0.0"]