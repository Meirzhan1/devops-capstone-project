# Используем официальный образ Python как базовый
FROM python:3.9-slim

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем файл с зависимостями и устанавливаем их
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем исходный код приложения в контейнер
COPY service/ ./service/

# Указываем порт, который будет слушать приложение
EXPOSE 8080

# Команда для запуска микросервиса через gunicorn
CMD ["gunicorn", "--bind=0.0.0.0:8080", "--log-level=info", "service:app"]
