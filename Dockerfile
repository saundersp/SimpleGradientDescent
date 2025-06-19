FROM alpine:3.22.0

RUN apk add --no-cache \
	bash=5.2.37-r0 \
	python3-dev=3.12.11-r0 \
	gcc=14.2.0-r6 \
	g++=14.2.0-r6 \
	linux-headers=6.14.2-r0 \
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
