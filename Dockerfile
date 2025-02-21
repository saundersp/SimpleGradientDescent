FROM alpine:3.21.3

RUN apk add --no-cache \
	bash=5.2.37-r0 \
	python3-dev=3.12.9-r0 \
	gcc=14.2.0-r4 \
	g++=14.2.0-r4 \
	linux-headers=6.6-r1 \
	&& rm -f /var/cache/apk/* \
	&& adduser -D SimpleGradientDescent

USER SimpleGradientDescent

WORKDIR /home/SimpleGradientDescent

COPY requirements.txt helper.sh ./

RUN ./helper.sh i

COPY *.py *.ipynb ./

EXPOSE 8888

ENTRYPOINT ["./helper.sh"]
CMD ["l"]
