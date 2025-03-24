.PHONY: all build test clean deb

# Имя программы
TARGET = Lab1

# Путь к исходным файлам
SRCS = ./*.c

# Путь к директории для сборки
BUILD_DIR = ./build

# Сборка программы
build:
	@echo "Сборка программы..."
	@mkdir -p $(BUILD_DIR)
	@g++ $(SRCS) -o $(BUILD_DIR)/$(TARGET)

# Проведение тестов
test:
	@echo "Запуск тестов..."
	@bash test.sh

# Очистка проекта
clean:
	@echo "Очистка временных файлов..."
	@rm -f $(BUILD_DIR)/$(TARGET)

# Сборка .deb пакета
deb:
	@echo "Сборка .deb пакета..."
	@mkdir -p Labs/usr/bin
	@cp $(BUILD_DIR)/$(TARGET) Labs/usr/bin/$(TARGET)
	@mkdir -p Labs/DEBIAN
	@echo "Package: $(TARGET)" > Labs/DEBIAN/control
	@echo "Version: 1.0" >> Labs/DEBIAN/control
	@echo "Architecture: amd64" >> Labs/DEBIAN/control
	@echo "Maintainer: *** <***>" >> Labs/DEBIAN/control
	@echo "Description: ***" >> Labs/DEBIAN/control
	@dpkg-deb --build Labs
	@rm -rf countword

