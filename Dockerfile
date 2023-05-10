# estágio de construção
FROM golang:alpine AS build

WORKDIR /app

COPY . .

RUN go build -o main .

# estágio final
FROM scratch

COPY --from=build /app/main /app

CMD ["/app/main"]
