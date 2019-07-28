FROM python:3.7

LABEL "name"="Python"
LABEL "maintainer"="Thomas Gaudin <thomas.gaudin@centraliens-lille.org>"
LABEL "version"="0.12.5-1"

LABEL "com.github.actions.name"="GitHub Action for Python"
LABEL "com.github.actions.description"="Run actions requring Python. Some usual tools are preinstalled, such as black, mypy, bandit, or pylint."
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="green"

RUN apt update && apt install -y jq \
  && pip install --upgrade pip \
  && pip install detect-secrets==0.12.5

COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
COPY entrypoint.sh diff.py /

ENTRYPOINT [ "/entrypoint.sh" ]
