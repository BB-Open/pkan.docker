FROM plone:5

COPY pkan.cfg /plone/instance/
RUN buildDeps="git" \
 && apt-get update \
 && apt-get install -y --no-install-recommends $buildDeps \
 && cd /plone/instance \
 && gosu plone buildout -c pkan.cfg \
 && apt-get purge -y --auto-remove $buildDeps \
 && rm -rf /plone/buildout-cache/downloads/*
