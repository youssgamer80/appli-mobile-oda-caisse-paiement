import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:oda_cagnotte/components/text_styles.dart';

enum AppButtonType {
  Primary,
  PrimaryLeft,
  PrimaryRight,
  PrimaryOutline,
  Success,
  SuccessOutline,
  Danger,
  DangerOutline,
}

/// A widget for buttons
class AppButton extends StatefulWidget {
  final AppButtonType type;
  final String text;
  final Function onPressed;
  final bool disabled;
  final bool buttonTop;
  final bool buttonMiddle;
  final bool placeholder;

  AppButton(
      {required this.type,
      required this.text,
      required this.onPressed,
      this.disabled = false,
      this.buttonTop = false,
      this.placeholder = false,
      this.buttonMiddle = false});

  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Opacity(
      opacity: widget.disabled ? 0.4 : 1.0,
      child: Container(
        margin: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          // gradient: (widget.type == AppButtonType.Primary ||
          //         widget.type == AppButtonType.PrimaryOutline ||
          //         widget.type == AppButtonType.PrimaryLeft ||
          //         widget.type == AppButtonType.PrimaryRight)
          //     ? StateContainer.of(context).curTheme.gradientPrimary
          //     : (widget.type == AppButtonType.Danger ||
          //             widget.type == AppButtonType.DangerOutline ||
          //             widget.type == AppButtonType.Success ||
          //             widget.type == AppButtonType.SuccessOutline)
          //         ? null
          //         : StateContainer.of(context)
          //             .curTheme
          //             .gradientPrimary, // Success color placeholder
          color: (widget.type == AppButtonType.Danger ||
                  widget.type == AppButtonType.DangerOutline)
              ? Theme.of(context).primaryColor
              : widget.type == AppButtonType.Success ||
                      widget.type == AppButtonType.SuccessOutline
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColor,
          // boxShadow: [
          //   widget.type == AppButtonType.Primary ||
          //           widget.type == AppButtonType.PrimaryLeft ||
          //           widget.type == AppButtonType.PrimaryRight
          //       ? StateContainer.of(context).curTheme.shadowPrimaryOne
          //       : widget.type == AppButtonType.PrimaryOutline
          //           ? StateContainer.of(context).curTheme.shadowPrimaryTwo
          //           : widget.type == AppButtonType.Success
          //               ? StateContainer.of(context).curTheme.shadowSuccessOne
          //               : widget.type == AppButtonType.SuccessOutline
          //                   ? StateContainer.of(context)
          //                       .curTheme
          //                       .shadowSuccessTwo
          //                   : widget.type == AppButtonType.Danger
          //                       ? StateContainer.of(context)
          //                           .curTheme
          //                           .shadowDangerOne
          //                       : StateContainer.of(context)
          //                           .curTheme
          //                           .shadowDangerTwo,
          // ],
        ),
        child: widget.type == AppButtonType.Primary ||
                widget.type == AppButtonType.PrimaryLeft ||
                widget.type == AppButtonType.PrimaryRight ||
                widget.type == AppButtonType.Success ||
                widget.type == AppButtonType.Danger
            // Primary Button
            ? FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: !widget.placeholder
                    ? AutoSizeText(
                        widget.text,
                        textAlign: TextAlign.center,
                        maxLines: widget.type == AppButtonType.Danger ? 2 : 1,
                        stepGranularity: 0.1,
                        style: widget.type == AppButtonType.Danger
                            ? AppStyles.primaryParagraphText12(context)
                            : AppStyles.witheParagraphText12(context),
                      )
                    // Placeholder button rectangle
                    : Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: AutoSizeText(
                          widget.text,
                          textAlign: TextAlign.center,
                          maxLines: widget.type == AppButtonType.Danger ? 2 : 1,
                          stepGranularity: 0.1,
                          style: widget.type == AppButtonType.Danger
                              ? AppStyles.primaryParagraphText12(context)
                              : AppStyles.primaryParagraphText12(context),
                        ),
                      ),
                splashColor: Theme.of(context).backgroundColor.withOpacity(.3),
                highlightColor:
                    Theme.of(context).backgroundColor.withOpacity(.15),
                onPressed: () {
                  if (widget.onPressed != null && !widget.disabled) {
                    widget.onPressed();
                  }
                  return;
                },
              )
            // Primary Outlined Button
            : Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(2),
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.transparent,
                    ),
                    child: FlatButton(
                      child: AutoSizeText(
                        widget.text,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        stepGranularity: 0.1,
                        style: widget.type == AppButtonType.DangerOutline
                            ? AppStyles.primaryParagraphText12(context)
                            : widget.type == AppButtonType.SuccessOutline
                                ? AppStyles.primaryParagraphText12(context)
                                : AppStyles.primaryParagraphText12(context),
                      ),
                      color: Colors.transparent,
                      splashColor: widget.type == AppButtonType.SuccessOutline
                          ? Theme.of(context).primaryColor.withOpacity(0.3)
                          : widget.type == AppButtonType.DangerOutline
                              ? Theme.of(context).primaryColor.withOpacity(0.3)
                              : Theme.of(context).primaryColor.withOpacity(0.3),
                      highlightColor: widget.type ==
                              AppButtonType.SuccessOutline
                          ? Theme.of(context).primaryColor.withOpacity(0.3)
                          : widget.type == AppButtonType.DangerOutline
                              ? Theme.of(context).primaryColor.withOpacity(0.3)
                              : Theme.of(context).primaryColor.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      onPressed: () {
                        if (widget.onPressed != null && !widget.disabled) {
                          widget.onPressed();
                        }
                        return;
                      },
                    ),
                  ),
                ],
              ),
      ),
    ));
  }
}
