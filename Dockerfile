FROM golang:latest as builder
RUN mkdir /app
ADD . /app
WORKDIR /app
#RUN go get ./...
RUN go get -d -v github.com/ipfs/go-ipfs-api
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM ipfs/go-ipfs:latest
#WORKDIR /export
COPY --from=builder /app/ /export/.
