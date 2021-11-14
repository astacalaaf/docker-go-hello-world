FROM golang:alpine

RUN apk update && apk add git

ARG DEFAULT_PORT
ARG APP_INSTANCE_ID

ENV PORT=${DEFAULT_PORT}
ENV INSTANCE_ID=${APP_INSTANCE_ID}

RUN echo "golang apps are running on port ${DEFAULT_PORT}"
RUN echo "golang apps name are ${APP_INSTANCE_ID}"

WORKDIR /app

COPY . .

RUN go mod tidy
RUN go build -o binary

ENTRYPOINT [ "./binary" ]
