# WeexDemo
###weex学习简单Demo

**weex简单学习及使用，包括页面的展示及js获取本地图片*

#### 一、加载图片

#####加载网络和本地的图片资源稍有不同在（3）实现协议中体现

*1、加载图片需要创建一个继承自NSObject的类*

*2、让这个新建的类遵守WXImgLoaderProtocol协议*

*3、在这个类的.m文件中实现协议*

#### 二、加载js页面

##### 一看就懂，weex只不过是提供给网页展示的载体，点击执行方法只是把js代码通过jsBridge实现与原生交互，WXBridgeContext.m中可以看到点击所调用的方法

- -(void)executeJsMethod:(WXCallJSMethod *)method

  ​

  ​









