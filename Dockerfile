FROM balenalib/intel-nuc:buster-20200604 as run

RUN apt-get update && apt-get install --no-install-recommends -yq \
	lm-sensors \
	stress-ng \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY ./start.sh .

CMD ["bash", "start.sh"]
