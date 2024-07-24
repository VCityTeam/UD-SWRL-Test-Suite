FROM python:3.11.8-alpine

# install dependencies
RUN apk update && \
    apk upgrade && \
    apk add git
RUN pip install --upgrade pip && \
    pip install rdflib && \
    pip install owlready2

# Use a sparse checkout to get test suite
RUN mkdir /UD-SWRL-Test-Suite
WORKDIR /UD-SWRL-Test-Suite
RUN git init && \
    git sparse-checkout init && \
    git sparse-checkout set "rules/swrl_rules.py"
RUN git remote add -f origin https://github.com/VCityTeam/UD-Graph.git && \
    git pull origin master

CMD [ "sh" ]