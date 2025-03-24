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
	@bash test

# Очистка проекта
clean:
	@echo "Очистка временных файлов..."
	@rm -f $(BUILD_DIR)/$(TARGET)

# Сборка .deb пакета
deb:
	@echo "Сборка .deb пакета..."
	@mkdir -p Lab1/usr/bin
	@cp $(BUILD_DIR)/$(TARGET) Lab1/usr/bin/$(TARGET)
	@mkdir -p Lab1/DEBIAN
	@echo "Package: $(TARGET)" > Lab1/DEBIAN/control
	@echo "Version: 1.0" >> Lab1/DEBIAN/control
	@echo "Architecture: amd64" >> Lab1/DEBIAN/control
	@echo "Maintainer: *** <***>" >> Lab1/DEBIAN/control
	@echo "Description: ***" >> Lab1/DEBIAN/control
	@dpkg-deb --build Lab1
	@rm -rf countword

