FROM python:3.11-slim-bullseye
WORKDIR /app
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/maziluedoardo14-glitch/Lorenzobatti.git .
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 7860
CMD ["uvicorn", "run:main_app", "--host", "0.0.0.0", "--port", "7860", "--workers", "4"]

