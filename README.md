ofx-addons-alias is a shell script which creates aliases to ofxaddons without "ofx" prefix.
================

I don't want to type "ofx" anymore while I'm looking for an addon........

![image](https://31.media.tumblr.com/d7f273534496832d4d468c54425da71a/tumblr_n0mvh0ktgU1s2up8jo1_1280.png)

I want to type just "cv" when I look for ofxCv, instead of typing ofxCv.
ofx-addons-alias.sh creates aliases to every addon in your `{OF-ROOT}/addons` directory. eventually your addons-alias directory will be like this:

![image](https://24.media.tumblr.com/f6c29d7574ae9bf16dc266342767bef4/tumblr_n0mvh0ktgU1s2up8jo2_r2_1280.png)


## installation
1. unzip or clone this repository to your `{OF_ROOT}` directory
2. run `{OF_ROOT}/ofx-addons-alias/ofx-addons-alias.sh`

## note
- when you select an alias file, `cmd + option + O` opens the actual folder
- you can rename ofx-addons-alias dirname. for instance, you can rename "ofx-addons-alias" to "addons-alias" since we are going to avoid typing ofx prefix!