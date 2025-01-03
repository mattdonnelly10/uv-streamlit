FROM python:3.12-slim-bookworm

# Install uv
RUN pip install --no-cache-dir uv

# Set working directory
WORKDIR /app

# Install Streamlit globally via uv pip
RUN uv pip install streamlit --system

# Expose Streamlit’s default port
EXPOSE 8501

# Use uv to run Streamlit apps by default
ENTRYPOINT ["uv", "run", "streamlit", "run"]
CMD ["/app/app.py", "--server.port=8501", "--server.address=0.0.0.0"]
