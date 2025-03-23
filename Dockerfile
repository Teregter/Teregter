FROM ubuntu:latest

# Установим необходимые зависимости
RUN apt-get update && apt-get install -y dpkg

# Скопируем .deb пакет из артефакта в контейнер
COPY Lab1.deb /tmp/

# Установим пакет
RUN dpkg -i /tmp/lab1.deb

# Укажем правильный путь к исполнимому файлу
ENTRYPOINT ["/usr/bin/lab1"]
