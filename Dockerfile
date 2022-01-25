## We specify the base image we need for our
## go application
FROM golang:alpine
## We create an /app directory within our
## image that will hold our application source
## files
RUN mkdir /mirth_channel_exporter
## We copy everything in the root directory
## into our /app directory
ADD . /mirth_channel_exporter
## We specify that we now wish to execute 
## any further commands inside our /app
## directory
WORKDIR /mirth_channel_exporter
## we run go build to compile the binary
## executable of our Go program
RUN go build -o main .
# Export necessary port
EXPOSE 9141
## Set-Env-Vars
ENV MIRTH_ENDPOINT="https://yourmmirthserver:port"
ENV MIRTH_USERNAME="your mirthuser"
ENV MIRTH_PASSWORD="your secret"
## Our start command which kicks off
## our newly created binary executable
CMD ["/mirth_channel_exporter/main"]