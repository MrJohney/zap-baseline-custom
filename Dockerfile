# Customized Owasp ZAP Dockerfile with support for authentication
FROM owasp/zap2docker-weekly
MAINTAINER Gordon Young <gjyoung1974@gmail.com>

USER root

# Tune the versions of web drivers
ENV geckoversion="v0.11.1"
ENV firefoxversion="46.0"
ENV seleniumversion="2.53.6"

# Install a Selenium compatible firefox
RUN apt-get -y remove firefox

RUN cd /opt && \
	wget https://github.com/mozilla/geckodriver/releases/download/${geckoversion}/geckodriver-${geckoversion}-linux64.tar.gz && \
	tar -xvzf geckodriver-${geckoversion}-linux64.tar.gz && \
	chmod +x geckodriver && \
	ln -s /opt/geckodriver /usr/bin/geckodriver && \
	export PATH=$PATH:/usr/bin/geckodriver

RUN cd /opt && \
	wget http://ftp.mozilla.org/pub/firefox/releases/${firefoxversion}/linux-x86_64/en-US/firefox-${firefoxversion}.tar.bz2 && \
	bunzip2 firefox-${firefoxversion}.tar.bz2 && \
	tar xvf firefox-${firefoxversion}.tar && \
	ln -s /opt/firefox/firefox /usr/bin/firefox
	
RUN pip install selenium==${seleniumversion}
RUN pip install pyvirtualdisplay

COPY zap-baseline-custom.py /zap/

# Add our custom "overlay" version of zap-baseline-custom.py
RUN chown zap:zap /zap/zap-baseline-custom.py && \ 
	chmod +x /zap/zap-baseline-custom.py

USER root
