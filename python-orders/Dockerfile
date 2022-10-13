FROM python:alpine

WORKDIR /usr/src/app

COPY . .

RUN pip install 'strawberry-graphql[debug-server]'

EXPOSE 8000

CMD strawberry server schema