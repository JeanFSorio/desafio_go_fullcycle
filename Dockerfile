FROM golang:alpine as build

WORKDIR /go/src/app
COPY main.go . 
RUN CGO_ENABLED=0 go build -ldflags '-w -s' -o /app main.go

FROM scratch as release
COPY --from=build /app /app
CMD [ "./app" ]