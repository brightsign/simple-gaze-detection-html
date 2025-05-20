# ML/AI/CV Demo of Gaze Detection running on NPU

This demo HTML/JS application showcases the tech behind Brightsign's new machine learning algorithms run _on the player_. An HTML frontend running a Node.js script that displays the output of the ML algorithm on the player. The Demo should:

- Show the images output from the ML application front and center on the screen
- Images update at 30 fps just like video
- If no image update in 5 seconds (meaning no people detected for 5 seconds), the screen will go to black
- A live update of the incoming UDP messages at the bottom of the screen

### TODO

- "presentation" (video?) in upper third
- output, decorated camera view in middle third
- "stats" in bottom third
- figure out how to rotate the display to be portrait (NB there are some notes that it's different and maybe only 1080p on RK)

   * might be [here](https://brightsign.atlassian.net/wiki/spaces/DOC/pages/370678463/videomodeconfiguration)

If you are operating from the repository and wish to build this app and run it yourself, you will need to follow a few steps:

## Building the App

### NVM

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

Can't get `bsc` to work... 

so zip the dist and copy to player
