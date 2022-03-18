FROM python:3.6
MAINTAINER Shekhar Gulati "shekhargulati84@gmail.com"
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 80:5000
ENTRYPOINT ["python"]
CMD ["app.py"]
