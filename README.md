# BrightSign Model Package (BSMP) Demo using and HTML5 Application

This demo HTML/JS application showcases the tech behind the NPU that is enabled in Brightsign players.  This demo shows:

- Full motion video
- A "picture-in-picture" of what the camera AI "sees" - including bounding boxes around faces
  - faces looking at the screen will be bounded in green, otherwise red
- A live update of the incoming UDP messages at the bottom of the screen

## Building the App

```sh
nvm install --lts
nvm use --lts
```

First, clone the repository. Then, from the home directory of this repo:

1. `npm install`
2. `npm run build`

You should now see a `node_modules/` and `dist/` folder now in your repository. The code in `dist/` is the build application.

From here, you need to deploy the built application.

## Deploying the Application

In order to run the application on a Brightsign player, the `autorun.brs` file must be on the root of the player's SD card. Then, the `dist/` folder needs to be put on the root of the SD card, with the folder contents still within the folder. The file structure should look like:

```sh
SD Card
  * autorun.brs
  - dist/
    * index.html
    * bundle.js
```

The Brightsign CLI is the easiest way to do this, find info on that [here](https://www.npmjs.com/package/@brightsign/bsc).

## Ensure the BSMP is Installed

If your player needs the extension installed, include the [bsfw installation package](./bsfw/cobra-standalone-npu_gaze-0.1.3-alpha.bsfw) on the root of the SD card and it will be automatically installed on the next boot.

This BSMP is released as an ALPHA quality only.  

## Licensing

This project is released under the terms of the [Apache 2.0 License](./LICENSE.txt).  
