CXX = g++
CXXFLAGS = -std=c++11 -Wall -pthread
TARGET = wifihack
SOURCE = main.cpp

# Определяем домашнюю директорию пользователя
HOME_DIR = $(shell echo $$HOME)
# Полный путь к папке проекта
PROJECT_DIR = $(HOME_DIR)/Automated-WPA2-Handshake-Cracking-Script

all: $(PROJECT_DIR) $(TARGET)

# Создаём папку проекта в домашней директории (только если её нет)
$(PROJECT_DIR):
	mkdir -p $(PROJECT_DIR)

# Компилируем и сразу перемещаем в целевую папку
$(TARGET): $(SOURCE)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SOURCE)
	mv $(TARGET) $(PROJECT_DIR)/

# Очистка — удаляем только скомпилированный файл, НЕ папку
clean:
	rm -f $(PROJECT_DIR)/$(TARGET)
	rm -f $(TARGET)  # на случай, если остался в текущей папке

install:
	sudo cp $(PROJECT_DIR)/$(TARGET) /usr/local/bin/

run: $(TARGET)
	sudo $(PROJECT_DIR)/$(TARGET)

help:
	@echo "make        - создать папку (если её нет) и скомпилировать туда"
	@echo "make clean  - удалить только скомпилированный файл (папка проекта остаётся)"
	@echo "make run    - скомпилировать и запустить"
	@echo "make install - установить в систему"