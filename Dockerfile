FROM python:3.8

# set work directory
WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN apt-get update
RUN apt-get -y install dnsutils
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# copy project
COPY . /app/

EXPOSE 8000

CMD ["python3", "pygoat/manage.py" ,"runserver", "0.0.0.0:8000"]
