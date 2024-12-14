FROM ubuntu:latest
RUN apt update 
WORKDIR /app
COPY . .
CMD ["sh","hello", "echo"]