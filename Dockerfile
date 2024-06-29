FROM golang AS builder

WORKDIR /app

COPY . /app

RUN go build -o hello-word hello-word.go

FROM scratch

WORKDIR /app

COPY --from=builder /app/hello-word ./

CMD [ "./hello-word" ]