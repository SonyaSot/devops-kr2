FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

RUN useradd --system --create-home app
USER app

EXPOSE 8004  
CMD ["gunicorn", "--bind", "0.0.0.0:8004", "app:app"]
