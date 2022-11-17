FROM --platform=linux/amd64 python:latest

# Updates and install net-tool
RUN apt update 
RUN apt install -y net-tools

# Create a working Directory
WORKDIR /app

# Adding the url-shortener files to /app
ADD static /app/static
ADD templates /app/templates
ADD application.py /app/
ADD requirements.txt /app/

# Install pip and install all the dependancies
RUN pip install pip --upgrade
RUN pip install -r requirements.txt

# Adding Variable
ENV FLASK_APP=application

# Open up port 8000
EXPOSE 5000/tcp

# Running the Flask Application
ENTRYPOINT [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]


