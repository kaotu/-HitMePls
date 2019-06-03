FROM python:3.7.3-alpine

COPY . /app

WORKDIR /app

RUN pip install  Django==2.2.1 \
                    pytz==2019.1 \ 
                    sqlparse==0.3.0

RUN pip install -r requirements.txt

ENTRYPOINT [ "sh","-c","cd hit_me_please && python manage.py migrate && python manage.py runserver 0.0.0.0:8000" ]
