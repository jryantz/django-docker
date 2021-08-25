FROM python:3.9-alpine

ENV PATH="/scripts:${PATH}"

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache gcc libc-dev postgresql-libs
RUN apk add --update --no-cache --virtual .tmp linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp

RUN mkdir /django-core
COPY ./django-core /django-core
WORKDIR /django-core
COPY ./scripts /scripts

RUN chmod +x /scripts/*

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static

RUN adduser -D user
RUN chown -R user:user /vol
RUN chmod -R 755 /vol/web
USER user

CMD ["entrypoint.sh"]
