FROM python:3.12-slim

WORKDIR /app

# Install dependencies
RUN pip install --no-cache-dir \
    hyperliquid-python-sdk \
    anthropic \
    python-dotenv \
    aiohttp \
    requests

# Copy source code & web application
COPY src ./src
COPY server.py ./server.py

# Support dynamic PORT for cloud providers (Cloud Run, Render, Railway)
ENV PORT=3000
EXPOSE 3000

CMD ["python", "server.py"]
