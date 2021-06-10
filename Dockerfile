FROM python:3.8

# create and set working directory
WORKDIR /usr/src/app/

# Add current directory code to working directory
ADD . /usr/src/app/ 

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apt-get update \
    && apt-get -y install libpq-dev gcc 

# install environment dependencies
RUN pip install --upgrade pip 

COPY ./requirements.txt .

# Install project dependencies
RUN pip install -r requirements.txt

#Install netcat
RUN apt-get install -y netcat

# copy entrypoint.sh
COPY ./entrypoint.sh .

# copy project
COPY . .

# run entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

# default command to execute 
CMD exec python manage.py runserver 0.0.0.0:8000

# expose the port
EXPOSE 8000