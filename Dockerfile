FROM python:3.12-slim-bookworm

RUN pip install uv

WORKDIR /app
COPY . /app

RUN uv lock && uv sync --no-cache

EXPOSE 8501

CMD ["uv", "run", "streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]

