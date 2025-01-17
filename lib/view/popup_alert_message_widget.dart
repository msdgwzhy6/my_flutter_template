import 'package:flutter/material.dart';
import 'package:my_flutter_template/res/my_styles.dart';
import 'package:my_flutter_template/res/my_theme.dart';
import 'package:my_flutter_template/utils/my_utils.dart';

class PopuAlertMessageWidget extends StatefulWidget {
  final Widget child;
  final String message;
  final String confirmText;
  final Color confirmBgColor;
  final Function onConfirmTap;
  final String cancelText;
  final Function onCancelTap;

  const PopuAlertMessageWidget({
    Key key,
    this.child,
    this.message,
    this.confirmText = "Sure",
    this.confirmBgColor,
    this.onConfirmTap,
    this.cancelText = "Cancel",
    this.onCancelTap,
  }) : super(key: key);

  @override
  _PopuAlertMessageWidgetState createState() => _PopuAlertMessageWidgetState();
}

class _PopuAlertMessageWidgetState extends State<PopuAlertMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16),
            widget.child != null
                ? widget.child
                : Container(
                    color: MyTheme.transparent,
                    height: 54,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    child: Text(widget.message, style: MyTextStyles.textGrayDeep(14), textAlign: TextAlign.center),
                  ),
            InkWell(
              child: Container(
                height: 54,
                margin: EdgeInsets.symmetric(horizontal: 28),
                decoration: BoxDecoration(
                  color: widget.confirmBgColor != null ? widget.confirmBgColor : MyTheme.transparent,
                  borderRadius: BorderRadius.circular(widget.confirmBgColor != null ? 54 : 0),
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.confirmText,
                  style: MyTextStyles.text(16, color: widget.confirmBgColor != null ? MyTheme.white : MyTheme.block),
                ),
              ),
              onTap: () {
                MyUtils.disMissLoadingDialog(context);
                if (widget.onConfirmTap != null) widget.onConfirmTap();
              },
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 28),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: FlatButton(
                  minWidth: double.infinity,
                  height: 56,
                  child: Text(widget.cancelText, style: MyTextStyles.textGray(14)),
                  color: MyTheme.bg_gray_tran,
                  textColor: MyTheme.text_block_gray_deep,
                  onPressed: () {
                    MyUtils.disMissLoadingDialog(context);
                    if (widget.onCancelTap != null) widget.onCancelTap();
                  },
                ),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
