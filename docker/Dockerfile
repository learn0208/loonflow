FROM python:3

WORKDIR /usr/src/app

# add pip aliyun
RUN mkdir ~/.pip
RUN echo "\
[global] \n\
trusted-host = mirrors.aliyun.com \n\
index-url = http://mirrors.aliyun.com/pypi/simple \n\
" > ~/.pip/pip.conf

COPY /requirements ./requirements

RUN pip install --no-cache-dir -r requirements/common.txt

RUN pip install uwsgi

COPY . .

ENTRYPOINT ["/usr/src/app/docker/docker-entrypoint.sh"]

CMD [ "uwsgi", "--ini", "uwsgi.ini" ]