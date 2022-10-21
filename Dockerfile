FROM mongo
RUN mkdir /config
WORKDIR /config
COPY wait-for-it.sh .
COPY mongo-setup.js .
COPY mongo-setup.sh .
RUN chmod +x /config/wait-for-it.sh
RUN chmod +x /config/mongo-setup.sh
WORKDIR /data/
COPY mongodb.key .
RUN chmod 600 /data/mongodb.key
CMD [ "bash", "-c", "/config/wait-for-it.sh mongo1:27011 -- /config/mongo-setup.sh"]
