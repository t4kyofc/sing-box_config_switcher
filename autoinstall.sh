#!/bin/sh

# Проверка на существование sing-box
if [ -d "/etc/sing-box" ]; then
    echo "Sing-box найден. Начинаем загрузку файлов..."

    # Загрузка файлов из GitHub
    wget -O /etc/init.d/pingservers https://raw.githubusercontent.com/t4kyofc/sing-box_config_switcher/refs/heads/mmain/files/pingservers
    wget -O /etc/init.d/servers.txt https://raw.githubusercontent.com/t4kyofc/sing-box_config_switcher/refs/heads/mmain/files/servers.txt
    wget -O /etc/init.d/servers_config.json https://raw.githubusercontent.com/t4kyofc/sing-box_config_switcher/refs/heads/mmain/files/servers_config.json

    # Делаем файл pingservers исполняемым
    chmod +x /etc/init.d/pingservers

    echo "Пожалуйста, заполните файлы servers_config.json и servers.txt"
    read -n 1 -s -r -p "Нажмите любую клавишу для продолжения..."


    # Ожидание нажатия клавиши
    read -n 1 -s

    # Запуск pingservers
    /etc/init.d/pingservers start

    echo "Запуск pingservers завершен."
else
    echo "Sing-box не найден. Скрипт завершен."
fi
