FROM web3labs/epirus-free-web:latest
RUN rm /app/public/static/logo.svg
RUN rm /app/src/theming/index.ts
RUN rm /app/src/data/data-side-content.ts
# RUN rm app/src/pages/log-in/index.tsx
COPY logo.svg /app/public/static/logo.svg
COPY index.ts /app/src/theming/index.ts
COPY data-side-content.ts /app/src/data/data-side-content.ts
COPY index.tsx app/src/pages/log-in/index.tsx
WORKDIR /app
CMD ["node dist"]




# # Dockerfile.defaults
# # Make the base image configurable
# ARG BASE_IMAGE=python:3.9-bullseye
# FROM ${BASE_IMAGE}

# USER root

# RUN apt-get -qq -y update && \
#     apt-get -qq -y upgrade && \
#     apt-get -y autoclean && \
#     apt-get -y autoremove && \
#     rm -rf /var/lib/apt/lists/*

# # Create user "docker"
# RUN useradd -m docker && \
#     cp /root/.bashrc /home/docker/ && \
#     mkdir /home/docker/data && \
#     chown -R --from=root docker /home/docker

# ENV HOME /home/docker
# WORKDIR ${HOME}/data
# USER docker

# CMD ["/bin/bash"]