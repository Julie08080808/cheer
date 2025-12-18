FROM python:3.11-bookworm

WORKDIR /app

# 安裝 GPIO 套件
RUN apt-get update && apt-get install -y \
    gcc g++ make python3-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]



