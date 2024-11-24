#!/bin/sh

# Проверка на существование sing-box
if [ -d "/path/to/sing-box" ]; then
    echo "Sing-box найден. Начинаем загрузку файлов..."

    # Загрузка файлов из GitHub
    wget -O /etc/init.d/pingservers https://raw.githubusercontent.com/t4kyofc/sing-box_config_switcher/refs/heads/main/files/pingservers
    wget -O /etc/init.d/servers.txt https://raw.githubusercontent.com/t4kyofc/sing-box_config_switcher/refs/heads/main/files/servers.txt
    wget -O /etc/init.d/servers_config.json https://raw.githubusercontent.com/t4kyofc/sing-box_config_switcher/refs/heads/main/files/servers_config.json

    # Делаем файл pingservers исполняемым
    chmod +x /etc/init.d/pingservers

    echo "Пожалуйста, заполните файлы servers_config.json и servers.txt"
    echo "Нажмите любое клавиша для продолжения после заполнения..."

    # Ожидание нажатия клавиши
    read -n 1 -s

    # Запуск pingservers
    /etc/init.d/pingservers

    echo "Запуск pingservers завершен."
else
    echo "Sing-box не найден. Скрипт завершен."
fi
