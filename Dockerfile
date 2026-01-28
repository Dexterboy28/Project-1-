# Pin to stable Debian
FROM python:3.9-slim-bookworm

WORKDIR /app

# Prevent apt from hanging in CI
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies safely
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gcc \
        default-libmysqlclient-dev \
        pkg-config && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir 

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
