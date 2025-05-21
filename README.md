# BrightSign Model Package (BSMP) Demo using and HTML5 Application

This demo HTML/JS application showcases the tech behind the NPU that is enabled in Brightsign players.  This demo shows:

- Full motion video
- A "picture-in-picture" of what the camera AI "sees" - including bounding boxes around faces
  - faces looking at the screen will be bounded in green, otherwise red
- A live update of the incoming UDP messages at the bottom of the screen


## Prerequisites

This project assumes you are working in Linux.  On MacOS we get an error in the dependencies:

```
npm error Error: Cannot find module 'node-bin-darwin-arm64/package.json'
```

We hope to resolve this soon (a PR would be welcome!).

## Building the App

First, clone the repository. Then, from the home directory of this repo:

```
make prep
make build
```

You should now see a `node_modules/` and `dist/` folder now in your repository. The code in `dist/` is the built application.

## Deploying the Application

The easiest way to build the file folder you need is to:

```
make publish
```

This should place all the files you need into the "sd" folder.  It should look like this:

```sh
sd/
├── 3840x2160-30fps-SF-bridge.mp4
├── autorun.brs
└── dist
    ├── bundle.js
    └── index.html
```

## Ensure the BSMP is Installed

If your player needs the extension installed, include the [bsfw installation package](./bsfw/cobra-standalone-npu_gaze-0.1.3-alpha.bsfw) on the root of the SD card and it will be automatically installed on the next boot.

This BSMP is an ALPHA release.  

## Licensing

This project is released under the terms of the [Apache 2.0 License](./LICENSE.txt).  
