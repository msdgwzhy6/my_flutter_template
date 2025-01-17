/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/11/27 0027
/// email: maoqitian068@163.com
/// des:  loading 效果使用 flutter_spinkit 库
import 'package:flutter/material.dart';
import 'package:my_flutter_template/res/my_theme.dart';

import 'loading/loading.dart';

class LoadingWidget extends StatefulWidget {
  String loadingText;
  bool outsideDismiss;

  Function dismissDialog;

  LoadingWidget({
    Key key,
    this.loadingText = "loading...",
    this.outsideDismiss = true,
    this.dismissDialog,
  }) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.dismissDialog != null) {
      widget.dismissDialog(() {
        /// 将关闭 Loading 的方法传递到调用的页面.
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.outsideDismiss ? _dismissLoading : null,
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: LoadingIndicator(color: MyTheme.text_block_gray_light),
        ),
      ),
    );
  }

  //关闭 loading
  _dismissLoading() {
    Navigator.of(context).pop();
  }
}
