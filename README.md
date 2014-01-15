XULoadingView
=============

如您的项目是 ARC，请在编译参数中添加 -fno-objc-arc

1. 将 src 目录中的文件添加到您的工程中去
2. 添加 #import "XULoadingView.h" 头文件
3. XULoadingView *loadingView = [[XULoadingView alloc] initWithParentView:self.view]; 初始化方法并传入加载时所覆盖的View
4. [loading show]; 显示加载界面
5. [loading dismiss]; 隐藏加载界面