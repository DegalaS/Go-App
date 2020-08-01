From ipfs/go-ipfs:latest
RUN mkdir /app
ADD . /app
WORKDIR /app
#RUN go install github.com/ipfs/go-ipfs-api
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .
CMD ["/app/main"]
