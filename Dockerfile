FROM alpine:3.20.2

RUN apk add --no-cache \
	bash=5.2.26-r0 \
	python3=3.12.3-r1 \
	python3-dev=3.12.3-r1 \
	gcc=13.2.1_git20240309-r0 \
	g++=13.2.1_git20240309-r0 \
	linux-headers=6.6-r0 \
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
