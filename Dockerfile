FROM ubuntu:latest

# Установим необходимые зависимости
RUN apt-get update && apt-get install -y dpkg

# Скопируем .deb пакет из артефакта в контейнер
COPY Labs.deb /tmp/

# Установим пакет
RUN dpkg -i /tmp/Labs.deb

# Укажем правильный путь к исполнимому файлу
ENTRYPOINT ["/usr/bin/Lab1"]
