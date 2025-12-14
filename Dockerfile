# Dockerfile which was used to generate the cs74/soltg-plus image

# Use Ubuntu 24.04 as the base image
FROM ubuntu:24.04

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    git \
    software-properties-common \
    lsb-release \
    gnupg \
    python3 \
    python3-venv \
    python3-pip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Solidity compiler (manually from GitHub)
RUN curl -fsSL https://github.com/ethereum/solidity/releases/download/v0.8.21/solc-static-linux -o /usr/local/bin/solc && \
    chmod +x /usr/local/bin/solc

# Install Foundry
RUN curl -L https://foundry.paradigm.xyz | bash && \
    /root/.foundry/bin/foundryup

ENV PATH="/root/.foundry/bin:$PATH"

# Install Z3 4.8.17 from source
RUN git clone https://github.com/Z3Prover/z3.git --branch z3-4.8.17 && \
    cd z3 && \
    python3 scripts/mk_make.py && \
    cd build && \
    make -j$(nproc) && \
    make install && \
    cd ../.. && rm -rf z3

# Installing SolTG+ in a virtual environment and adding the binary to PATH
RUN python3 -m venv /venv && \
    /venv/bin/pip install --upgrade pip && \
    /venv/bin/pip install soltg-plus

RUN git init && forge install foundry-rs/forge-std --no-commit

RUN apt-get update && apt-get install -y lcov

ENV PATH="/venv/bin:$PATH"

ENTRYPOINT ["solTg-plus"]

