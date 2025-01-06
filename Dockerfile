FROM python:3.12-slim-bookworm

# 1. Update pip and install dependencies system-wide
RUN pip install --no-cache-dir --upgrade pip setuptools

# 2. Set working directory
WORKDIR /app

# 3. Copy dependency files first (for better caching)
COPY requirements.txt .

# 4. Install Python dependencies system-wide
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of the application files
COPY . /app

# 6. Expose Streamlit’s default port
EXPOSE 8501

# 7. Use pip-installed Streamlit to run the app
ENTRYPOINT ["streamlit", "run"]
CMD ["/app/app.py", "--server.port=8501", "--server.address=0.0.0.0"]

