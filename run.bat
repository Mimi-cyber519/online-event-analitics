@echo off
cd /d %~dp0
if not exist venv\Scripts\python.exe (
    echo Создаю виртуальное окружение...
    python -m venv venv
    call venv\Scripts\activate
    pip install streamlit mysql-connector-python pandas plotly
) else (
    call venv\Scripts\activate
)
streamlit run app.py
pause
