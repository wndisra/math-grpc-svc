FROM golang:alpine AS build
WORKDIR /app
COPY . .
RUN go build -o mathsvc ./cmd/server

FROM alpine:3.11.3
WORKDIR /app
RUN cd /app
COPY --from=build /app/mathsvc /app/mathsvc

ENTRYPOINT [ "/app/mathsvc" ]