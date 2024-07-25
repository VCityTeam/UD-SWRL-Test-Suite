FROM python:3.11.8-alpine

# install dependencies
RUN apk update && \
    apk upgrade
RUN pip install --upgrade pip && \
    pip install rdflib && \
    pip install owlready2

RUN mkdir /UD-SWRL-Test-Suite
## Use a sparse checkout to get test suite
# WORKDIR /UD-SWRL-Test-Suite
# RUN git init && \
#     git sparse-checkout init && \
#     git sparse-checkout set "rules/swrl_rules.py"
# RUN git remote add -f origin https://github.com/VCityTeam/UD-Graph.git && \
#     git pull origin master

## Or download script from https://github.com/VCityTeam/UD-Graph/blob/master/rules/swrl_rules.py
RUN wget -O /UD-SWRL-Test-Suite/swrl_rules.py https://raw.githubusercontent.com/VCityTeam/UD-Graph/master/rules/swrl_rules.py

ENTRYPOINT [ "python", "/UD-SWRL-Test-Suite/swrl_rules.py" ]
