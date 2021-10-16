FROM python:3.9.7-buster
ENV PANDOC_VERSION "pandoc-2.14.2-1-amd64.deb"

RUN apt-get update && apt-get install -y neovim
RUN wget "https://github.com/jgm/pandoc/releases/download/2.14.2/pandoc-2.14.2-1-amd64.deb" -O "pandoc.deb" &&  dpkg -i "pandoc.deb"

RUN python3 -m pip install codebraid pantable

WORKDIR /code
COPY config .
COPY compile.sh .

RUN mkdir -p content
WORKDIR /content
COPY slide.md .

ENTRYPOINT ["/code/compile.sh"]
