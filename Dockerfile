FROM python:3.11-slim

# Avoid writing .pyc files and buffer stdout/stderr
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=8080

WORKDIR /app

# Install minimal build dependencies for any packages that need compilation
RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential gcc \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies first to leverage Docker layer caching
COPY requirements.txt .

RUN python -m pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy application source
COPY . .

# Cloud Run uses the PORT env var; expose the default 8080
EXPOSE 8080

# Run the ADK web command as requested
CMD ["adk", "web"]
