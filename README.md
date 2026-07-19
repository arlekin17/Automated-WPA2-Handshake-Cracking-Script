
***

# Automated WPA2 Handshake Cracking Script

<div align="center">

![License](https://img.shields.io/badge/license-GPLv3-green.svg)
![Platform](https://img.shields.io/badge/platform-Linux-orange.svg)
![Language](https://img.shields.io/badge/language-C++-purple.svg)

**A powerful automation tool for WPA2/WPA3 handshake capture and password cracking**

</div>

## 📋 Description

This script automates the process of capturing and cracking WPA2/WPA3 handshakes from Wi-Fi networks. The tool is designed for security auditing of your own wireless networks and password complexity testing.

## ✨ Features

- **Handshake Capture** – Automatic monitor mode setup and WPA2/WPA3 handshake capture
- **Hashcat Conversion** – Convert `.cap` files to `.22000` format for cracking
- **Local Cracking** – Password recovery using hashcat with rockyou2024 dictionary
- **Remote Cracking** – Send hash to GPU server and automatically run hashcat via SSH

##  How It Works

### Mode 1: Packet Capture
1. Stops interfering processes (`airmon-ng check kill`)
2. Enables monitor mode on Wi-Fi adapter (`airmon-ng start wlan0`)
3. Prompts for target MAC address (BSSID), channel number, and filename
4. Launches `airodump-ng` to capture handshake
5. Waits for client connection and captures the handshake

### Mode 2: Hashcat Conversion
1. Stops monitor mode
2. Restarts NetworkManager (network restoration)
3. Converts `.cap` file to `.22000` format using `hcxpcapngtool`

### Mode 3: Password Cracking
- **Local** – Unpacks dictionary and runs hashcat on your machine
- **Remote** – Copies hash via SCP and runs hashcat on remote GPU server

## 📦 Requirements

- Wi-Fi adapter with monitor mode support
- Linux (Arch, Debian, Ubuntu, Kali, Fedora)
- Password dictionary (e.g., rockyou2024.zip)

## 📥 Dependencies Installation

### Arch Linux / BlackArch
```bash
sudo pacman -S gcc aircrack-ng hcxtools p7zip
```

### Debian / Ubuntu / Kali
```bash
sudo apt update && sudo apt install -y g++ aircrack-ng hcxtools p7zip-full
```

### Fedora
```bash
sudo dnf install -y gcc-c++ aircrack-ng hcxtools p7zip
```

##  Usage

```bash
# Clone the repository
git clone https://github.com/arlekin17/Automated-WPA2-Handshake-Cracking-Script.git
cd Automated-WPA2-Handshake-Cracking-Script

# Compile the project
g++ -o wpa_cracker main.cpp -std=c++17

# Run the tool
sudo ./wpa_cracker
```

## ⚠️ Disclaimer

This tool is intended for **educational purposes** and **authorized security testing** only. Always ensure you have proper authorization before testing any network. The author is not responsible for any misuse of this software.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/arlekin17/Automated-WPA2-Handshake-Cracking-Script/issues).

## 📄 License

This project is licensed under the **GNU General Public License v3.0 (GPLv3)**. 

This means you are free to use, modify, and distribute this software. However, any derivative works or modifications must also be distributed under the same GPLv3 license, ensuring the code remains open-source. 

See the [LICENSE](LICENSE) file for the full legal text.

## 👤 Author

**arlekin17**
- GitHub: [@arlekin17](https://github.com/arlekin17)

---

<div align="center">

**⭐ Star this repo if you find it helpful!**

</div>

***

### 💡 Важный совет:
Чтобы лицензия работала юридически, не забудь добавить в корень твоего репозитория файл с именем **`LICENSE`** (без расширения). 
Ты можешь сделать это прямо на GitHub:
1. Зайди в свой репозиторий `Automated-WPA2-Handshake-Cracking-Script`.
2. Нажми **Add file** -> **Create new file**.
3. Назови файл `LICENSE`.
4. Справа появится кнопка **"Choose a license template"**. Нажми её, выбери **GNU General Public License v3.0** и нажми **Review and submit**.

Готово! Теперь твой проект полностью защищен лицензией GPLv3. Если нужно будет сделать то же самое для README основного проекта (Ikaros-Pocket) — просто скажи!
