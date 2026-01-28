FROM python:3.9-slim-bookworm

WORKDIR /app

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gcc \
        default-libmysqlclient-dev \
        pkg-config && \
    rm -rf /var/lib/apt/lists/*

# MUST have source + destination
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# MUST have source + destination
COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
