FROM golang:1.16-alpine3.12 AS builder

COPY main.go main.go

RUN go build -ldflags "-w" main.go

FROM scratch

COPY --from=builder /go/main main

CMD ["./main"]