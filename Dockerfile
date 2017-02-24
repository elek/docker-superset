FROM alpine:3.5
RUN apk --update add gcc ca-certificates libffi-dev python-dev linux-headers musl-dev postgresql-dev py-pip wxgtk-dev g++ cyrus-sasl-dev openldap-dev && rm -rf /var/cache/apk/* && update-ca-certificates
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h 
RUN mkdir -p  /opt/superset/conf
ENV CONF_DIR /opt/superset/conf
RUN pip install cryptography superset psycopg2 pyhive Flask-OAuth Flask-LDAP
ENV PYTHONPATH=$PYTHONPATH:/opt/superset/conf
ENTRYPOINT ["/usr/bin/superset","runserver"]
