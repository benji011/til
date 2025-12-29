.PHONY: help build serve clean deploy

help:
	@echo "Available commands:"
	@echo "  make build   - Build the Hugo site to docs/"
	@echo "  make serve   - Run Hugo development server"
	@echo "  make clean   - Remove generated docs/"
	@echo "  make deploy  - Build and commit docs/ for GitHub Pages"
	@echo "  make post    - Create a new post (requires DESC variable)"

build:
	cd hugosite && hugo

serve:
	cd hugosite && hugo server --buildDrafts --disableFastRender

clean:
	rm -rf docs/

deploy: clean build
	git add docs/
	@echo "Run 'git commit' and 'git push' to deploy to GitHub Pages"

post:
ifndef DESC
	$(error DESC is undefined. Usage: make post DESC="Your TIL description")
endif
	./til_post.sh "$(DESC)"
