.PHONY: always

test : utest
# Tests from command-line are failing due to some floating-point equality issue, apparently running with different precision than expected.
# So we'll just dump an image and run tests with that, since this avoids the problem. The added overhead is a drag, but it's not bad.

docker :
	docker build . -t orient

image : always
	cl -Q -sp orient --dump bin/orient.image

utest : image
	./bin/orient test

dtest : docker
	./bin/dcalc test
