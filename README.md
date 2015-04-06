# WXLAutolayout
•	支持Pixel或Point布局，免去了Pixel换算Point的麻烦

•	支持缩放Layout，配合Autolayout在开发iPhone版本的同时可自动适配iPad版本

•	在.pch中导入WXLAutoLayout头文件，之前需要用#define设置UI效果图设备型号，Pixel或Point Layout，是否缩放Layout

•	iPad缩放Layout下， 通过sys/utsname.h类库获得设备型号判断是否进行缩放

•	Pixel布局可根据UI效果图设备型号自动换算成Point，非Retina，Retina，@3x都可自动转换

•	在缩放Layout下，可选择font是否缩放 

