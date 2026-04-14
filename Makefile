CXX = g++
CXXFLAGS = -std=c++11 -Wall -pthread
TARGET = wifihack

all: $(TARGET)

$(TARGET): c.cpp
	$(CXX) $(CXXFLAGS) -o $(TARGET) c.cpp

clean:
	rm -f $(TARGET)

install:
	sudo cp $(TARGET) /usr/local/bin/

run: $(TARGET)
	sudo ./$(TARGET)

help:
	@echo "make       - скомпилировать программу"
	@echo "make clean - удалить скомпилированный файл"
	@echo "make run   - скомпилировать и запустить"
	@echo "make install - установить в систему"
