# react-native-progresshud 
[![npm version](https://img.shields.io/badge/npm-v3.8.6-red.svg)](https://www.npmjs.com/package/react-native-progresshud)

An implement of ProgressHUD for React-Native, similar to MBProgressHUD for iOS and KProgressHUD for Android.

## Installation

```
$ npm install react-native-progresshud --save
$ rnpm link
```



## Note about React requires

Since react-native 0.25.0, `React` should be required from `node_modules`.
React Native versions from 0.18 should be working out of the box, for lower
versions you should add `react` as a dependency in your `package.json`.


## Screenshot


## General Usage


```js
import RNProgressHUD from 'react-native-progresshud';
```
or

```js
var RNProgressHUD = require('react-native-progresshud');
```



===== API =====

Note :  used in Component

Simple text with duration
```js
RNProgressHUD.showSimpleText("Message",2000);
```

Spinner Indeterminate
```js
RNProgressHUD.showSpinIndeterminate();
RNProgressHUD.showSpinIndeterminate("Title");
RNProgressHUD.showSpinIndeterminate("Title","Details");
```

Determinate loading
```js
    var progress = 0.1;

    RNProgressHUD.showDeterminate({
      mode:'bar', //"bar" or "annular"   default:"annular"
      title:"title", 
      details:"details"
    });

    var interval =  setInterval(function () {
      if(progress <= 1){
        RNProgress.setProgress(progress);
      } else {
        RNProgress.dismiss();
        clearInterval(interval);
      }
      progress += 0.1;
    },1000);
```

Progress within determinate
```js
RNProgressHUD.setProgress(progress); // progress: 0 ~ 1
```


Dismiss
```js
RNProgressHUD.dismiss();
```


### Have problem ? 
please contact me : developer_mp@163.com













