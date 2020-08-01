FROM golang:latest as builder
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN go get ./...
#RUN go get -d -v github.com/ipfs/go-ipfs-api
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /app .
CMD ["./main"]
