#!/bin/bash
cd "$(dirname "$0")"
if [ ! -d "venv" ]; then
    echo "Создаю виртуальное окружение..."
    python3 -m venv venv
    source venv/bin/activate
    pip install streamlit mysql-connector-python pandas plotly
else
    source venv/bin/activate
fi
streamlit run app.py
read -p "Нажмите Enter для выхода..."
