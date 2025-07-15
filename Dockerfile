FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your app code
COPY . /app
WORKDIR /app

# Expose port for Render
EXPOSE 10000

# Run the voila app
CMD ["voila", "daily_downtime.ipynb", "--port=10000", "--no-browser", "--Voila.configuration.allow_origin=*"]
