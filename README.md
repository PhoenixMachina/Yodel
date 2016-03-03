# Yodel
[![Build Status](https://travis-ci.org/PhoenixMachina/Yodel.svg?branch=master)](https://travis-ci.org/PhoenixMachina/Yodel)
[![Licence MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![codecov.io](https://codecov.io/github/PhoenixMachina/Yodel/coverage.svg?branch=master)](https://codecov.io/github/PhoenixMachina/Yodel?branch=master)

A Julia router developed by PhoenixMachina

## Install
To install this package, run this command on your Julia console:
```
Pkg.clone("https://github.com/PhoenixMachina/Yodel")
```

## Using Yodel

### Understanding Yodel
Yodel is a router which you can use for your Julia web projects. You just need to have an XML file that looks like this :
```
<routes>
  <route url="home" controller="home" />
  <route url="news\/[a-zA-Z0-9]+\/" controller="news" variables="article">
</routes>
```
And we'll parse it into Route Object and provide you with a bunch of method to get what you want out of it.

### Get started
To start using Yodel, you need to add :
```
using Yodel
```

You first need to instanciate a YodelEngine "super" object which will define which xml file you'll be using. It has only one parameter, the absolute path to your xml file, which we usually call routes.xml .
```
ydl = Yodel("path/to/your/routes.xml"))
```

Well, now you actually need to write that file.

### Implementation
