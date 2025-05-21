prep:
	npm install
	wget https://firmware.bsn.cloud/cobra-standalone-npu_gaze-0.1.3-alpha.bsfw

build: 
	npm run build

publish: build
	rm -Rf sd/*
	mkdir sd/dist
	cp -R dist/* sd/dist/
	cp src/autorun.brs sd/
	cp *mp4 sd/
	cp *bsfw sd/
	tree sd/

clean:
	rm -Rf sd/*
	rm -Rf dist/*
	rm -Rf node_modules
	rm -Rf .DS_Store

