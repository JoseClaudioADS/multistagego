FROM golang:bullseye AS gobuild

WORKDIR /app
COPY . .

RUN go build main.go

FROM scratch
WORKDIR /app
COPY --from=gobuild /app .

ENTRYPOINT [ "./main" ]


