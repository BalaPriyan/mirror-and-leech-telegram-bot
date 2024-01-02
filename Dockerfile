FROM mysterysd/wzmlx:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt

# Add the commands to install additional dependencies
RUN apt-get update && \
    apt-get install -y aria2 && \
    apt-get install -y ffmpeg && \
    apt-get install -y mkvtoolnix mkvtoolnix-gui && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    snap install mediainfo

# Run the bento4.sh script
RUN bash bento4.sh

CMD ["bash", "start.sh"]
