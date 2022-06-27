
.docker-build: Dockerfile Gemfile
	DOCKER_BUILDKIT=1 docker build --tag thdot/techfolios .
	@touch $@

DOCKER_RUN = docker run --rm -v $(PWD):/work -p 4000:4000 thdot/techfolios

serve: .docker-build
	$(DOCKER_RUN) bundle exec jekyll serve --host=0.0.0.0

build: .docker-build
	$(DOCKER_RUN) bundle exec jekyll build
