FROM ubuntu:latest
RUN apt update 
WORKDIR /app
COPY . .
CMD ["sh", "-c", "echo alpha; echo beta"]