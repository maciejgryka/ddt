FROM ubuntu:artful

RUN apt-get update
RUN apt-get install -y software-properties-common python3-pip
RUN pip3 install -U pip setuptools pipenv

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN mkdir /app
WORKDIR /app

# copy the Pipenv files first, so we only reinstall whatever is needed if these
# files change, as opposed to when any files in /app change
COPY Pipfile Pipfile
COPY Pipfile.lock Pipfile.lock
RUN pipenv install --deploy --system

# now copy over ther rest of the stuff
COPY . /app

EXPOSE 8000
WORKDIR /app/helloworld
CMD ["/app/helloworld/start.sh"]
