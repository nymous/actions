FROM python:3.7

LABEL "name"="Python"
LABEL "maintainer"="Thomas Gaudin <thomas.gaudin@centraliens-lille.org>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="GitHub Action for Python"
LABEL "com.github.actions.description"="Run actions requring Python. Some usual tools are preinstalled, such as black, mypy, bandit, or pylint."
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="red"

RUN pip install --upgrade pip \
  && pip install \
    bandit \
    black \
    mypy \
    pylint \
    pipenv \
    poetry

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
