#!/bin/sh

# Checking for the existence of sing-box
# Проверка на существование sing-box
if [ -d "/etc/sing-box" ]; then
    echo "Sing-box found. Starting to load files..."
    echo "Sing-box найден. Начинаем загрузку файлов..."

    # Downloading files from GitHub
    # Загрузка файлов из GitHub
    wget -O /etc/init.d/pingservers https://raw.githubusercontent.com/t4kyofc/sing-box_config_switcher/refs/heads/main/files/pingservers
    wget -O /etc/init.d/servers.txt https://raw.githubusercontent.com/t4kyofc/sing-box_config_switcher/refs/heads/main/files/servers.txt
    wget -O /etc/init.d/servers_config.json https://raw.githubusercontent.com/t4kyofc/sing-box_config_switcher/refs/heads/main/files/servers_config.json

    # Making the pingservers file executable
    # Делаем файл pingservers исполняемым
    chmod +x /etc/init.d/pingservers

    echo "Please fill out the servers_config.json and servers.txt files."
    echo "Пожалуйста, заполните файлы servers_config.json и servers.txt"
    read -n 1 -s -r -p "Press any key to continue..."
    read -n 1 -s -r -p "Нажмите любую клавишу для продолжения..."

    # Waiting for a key press
    # Ожидание нажатия клавиши
    read -n 1 -s

    # Starting pingservers
    # Запуск pingservers
    /etc/init.d/pingservers start

    echo "Pingservers started."
    echo "Запуск pingservers завершен."
else
    echo "Sing-box not found. Script terminated."
    echo "Sing-box не найден. Скрипт завершен."
fi
