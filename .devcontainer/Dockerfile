FROM python:3.10

# Install system dependencies
RUN apt-get update && \
    apt-get install -y \
    git \
    curl \
    libmysqlclient-dev \
    redis-server \
    npm \
    && apt-get clean

# Install Node.js and Yarn
RUN npm install -g yarn

# Install wkhtmltopdf
RUN apt-get install -y xfonts-75dpi xfonts-100dpi fontconfig \
    && curl -LO https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb \
    && dpkg -i wkhtmltox_0.12.6-1.bionic_amd64.deb \
    && apt-get -f install -y

# Create a new user
RUN useradd -ms /bin/bash vscode
USER vscode
WORKDIR /home/vscode

# Install Bench CLI
RUN pip install frappe-bench
