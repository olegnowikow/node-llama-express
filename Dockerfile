FROM node:18

# Set up a new user named "user" with user ID 1000
#RUN useradd -o -u 1000 user

# Switch to the "user" user
#USER user

# Set home to the user's home directory
#ENV HOME=/root \
# 	PATH=/home/user/.local/bin:$PATH

# Set the working directory to the user's home directory
WORKDIR /app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json /app

RUN npm install

# Copy the current directory contents into the container at $HOME/app setting the owner to the user
COPY . /app

#ADD --chown=user https://huggingface.co/TheBloke/airoboros-13b-gpt4-GGML/resolve/main/airoboros-13b-gpt4.ggmlv3.q4_0.bin models/airoboros-13b-gpt4.ggmlv3.q4_0.bin

EXPOSE 7860
CMD [ "npm", "run", "start" ]