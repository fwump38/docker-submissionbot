FROM python:3-slim

MAINTAINER David fwump38@gmail.com

# Setup script directory
RUN mkdir /home/submissionbot
ADD ./requirements.txt /home/submissionbot/requirements.txt

#Update python requeriments
RUN pip install -r /home/submissionbot/requirements.txt

#Add python script to docker container and grant execution rights
ADD ./submissionbot.py /home/submissionbot/submissionbot.py
RUN chmod +x /home/submissionbot/submissionbot.py

# Start the script
CMD python /home/submissionbot/submissionbot.py