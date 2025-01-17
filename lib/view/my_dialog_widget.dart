import 'package:flutter/material.dart';
import 'package:my_flutter_template/res/my_styles.dart';
import 'package:my_flutter_template/res/my_theme.dart';
import 'package:my_flutter_template/utils/my_utils.dart';

/// 自定义 Dialog
class MyDialogWidget extends StatefulWidget {
  final String title;
  final String message;
  final TextStyle messageStyle;
  final String confirmText;
  final String cancelText;
  final Function onConfirmTap;
  final Function onCancelTap;
  final Widget child;
  final String doubleConfirmText;
  final Function onDoubleConfirmTap;
  final bool isDisMissConfirm;
  final bool isDoubleVipStyle;

  const MyDialogWidget({
    Key key,
    this.title,
    this.message,
    this.child,
    this.confirmText,
    this.cancelText,
    this.onConfirmTap,
    this.onCancelTap,
    this.messageStyle,
    this.doubleConfirmText,
    this.onDoubleConfirmTap,
    this.isDisMissConfirm = true,
    this.isDoubleVipStyle,
  }) : super(key: key);

  @override
  _MyDialogWidgetState createState() => _MyDialogWidgetState();
}

class _MyDialogWidgetState extends State<MyDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            margin: EdgeInsets.only(left: 32, right: 32),
            decoration: BoxDecoration(
              color: MyTheme.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 28,
              bottom: 6,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyUtils.isEmpty(widget.title) ? Container() : Text(widget.title, style: MyTextStyles.textBlock(16)),
                MyUtils.isEmpty(widget.title) ? Container() : SizedBox(height: 16),
                // 如果没有传入 message ，则一定是自定义布局
                _contentView(),
                SizedBox(height: 32),
                _conformButton(widget.confirmText, widget.onConfirmTap),
                MyUtils.isEmpty(widget.doubleConfirmText) ? Container() : SizedBox(height: 10),
                MyUtils.isEmpty(widget.doubleConfirmText) ? Container() : _conformButton(widget.doubleConfirmText, widget.onDoubleConfirmTap),
                SizedBox(height: 8),
                MyUtils.isEmpty(widget.cancelText) ? Container() : _cancelButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 如果没有传入 message ，则一定是自定义布局
  _contentView() {
    return MyUtils.isEmpty(widget.message)
        ? widget.child
        : Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        widget.message,
        style: widget.messageStyle == null ? MyTextStyles.textGray(14) : widget.messageStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  /// 确定按钮
  _conformButton(String text, Function onTap) {
    return ButtonTheme(
      minWidth: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.only(top: 15, bottom: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        color: MyTheme.main,
        elevation: 1,
        highlightElevation: 0,
        disabledElevation: 0,
        onPressed: () {
          if (widget.isDisMissConfirm) MyUtils.disMissLoadingDialog(context);

          if (onTap != null) onTap();
        },
        child: Text(text, style: MyTextStyles.textWhite(16, isFontWeightBold: true)),
      ),
    );
  }

  /// 取消按钮
  _cancelButton() {
    return ButtonTheme(
      minWidth: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.only(top: 15, bottom: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        color: MyTheme.transparent,
        elevation: 0,
        highlightElevation: 0,
        disabledElevation: 0,
        highlightColor: MyTheme.transparent,
        splashColor: MyTheme.transparent,
        onPressed: () {
          MyUtils.disMissLoadingDialog(context);

          if (widget.onCancelTap != null) {
            widget.onCancelTap();
          }
        },
        child: Text(widget.cancelText, style: MyTextStyles.textGray(14)),
      ),
    );
  }
}
