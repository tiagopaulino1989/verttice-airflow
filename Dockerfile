FROM apache/airflow:latest

COPY requirements.txt .

RUN python -m pip install --upgrade pip

RUN pip install -r requirements.txt

# you can also use regular install of the packages
RUN pip3 install pyodbc SQLAlchemy

# and if you are also planning to use Flask and Flask-SQLAlchemy
RUN pip3 install Flask Flask-SQLAlchemy

# # install FreeTDS and dependencies
# RUN apt-get update \
#  && apt-get install unixodbc -y \
#  && apt-get install unixodbc-dev -y \
#  && apt-get install freetds-dev -y \
#  && apt-get install freetds-bin -y \
#  && apt-get install tdsodbc -y \
#  && apt-get install --reinstall build-essential -y
# # populate "ocbcinst.ini" as this is where ODBC driver config sits
# RUN echo "[FreeTDS]\n\
# Description = FreeTDS Driver\n\
# Driver = /usr/lib/x86_64-linux-gnu/odbc/libtdsodbc.so\n\
# Setup = /usr/lib/x86_64-linux-gnu/odbc/libtdsS.so" >> /etc/odbcinst.ini

# #Install FreeTDS and dependencies for PyODBC
# RUN apt-get update && apt-get install -y tdsodbc unixodbc-dev \
#  && apt install unixodbc-bin -y  \
#  && apt-get clean -y

# RUN echo "[FreeTDS]\n\
# Description = FreeTDS unixODBC Driver\n\
# Driver = /usr/lib/arm-linux-gnueabi/odbc/libtdsodbc.so\n\
# Setup = /usr/lib/arm-linux-gnueabi/odbc/libtdsS.so" >> /etc/odbcinst.ini