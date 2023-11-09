import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heal_tec/src/core/theme/dimensions.dart';

class InputBox extends StatefulWidget {
  InputBox({
    super.key,
    this.controller,
    this.labelText,
    this.error,
    this.color,
    this.keyboardtype,
    this.errorText,
    this.inuptformat,
    this.obscureText,
    this.ispassword,
    this.istextarea,
    this.readonly,
    this.maxLength,
    this.maxLines,
    this.fontSize,
    this.minLine,
    this.prefix,
    this.isRounded = true,
    this.bgcolor,
    this.onchanged,
    this.onTap,
    this.suffixIcon,
  });
  TextEditingController? controller;
  String? labelText;
  String? errorText;
  Function? onchanged;
  List<TextInputFormatter>? inuptformat;
  bool? obscureText;
  bool? error;
  bool? ispassword = false;
  bool? istextarea = false;
  bool? readonly = false;
  TextInputType? keyboardtype;
  int? minLine = 1;
  int? maxLength = 300;
  bool? isRounded;
  Widget? prefix;
  Color? bgcolor;
  Widget? suffixIcon;
  double? fontSize;
  int? maxLines;
  Color? color;
  VoidCallback? onTap;

  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  bool? error;
  bool? obscureText;
  bool? hidepass = false;

  @override
  void initState() {
    if (widget.obscureText!) {
      setState(() {
        hidepass = true;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.labelText!,
            textAlign: TextAlign.start,
            style: TextStyle(
              color:
                  widget.color ?? Theme.of(context).textTheme.titleLarge!.color,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: widget.bgcolor ?? Colors.transparent,
              borderRadius: BorderRadius.circular(
                widget.isRounded! ? buttonHeight : subMarginHalf,
              ),
            ),
            child: TextField(
              onTap: widget.onTap,
              controller: widget.controller,
              cursorColor: Theme.of(context).colorScheme.onSecondary,
              obscureText: hidepass!,
              onChanged: widget.onchanged as void Function(String)?,
              inputFormatters: widget.inuptformat,
              maxLines: widget.istextarea! ? widget.maxLines : 1,
              textAlignVertical: TextAlignVertical.center,
              readOnly: widget.readonly!,
              maxLength: widget.maxLength,
              keyboardType: widget.keyboardtype ?? TextInputType.text,
              minLines: widget.minLine,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                //height: 2,
                fontSize: widget.fontSize ?? 14,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).textTheme.displayLarge!.color,
                decoration: TextDecoration.none,
              ),
              decoration: InputDecoration(
                focusColor: Theme.of(context).primaryColor,
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                filled: true,
                errorText: widget.error! ? widget.errorText : null,

                contentPadding: const EdgeInsets.all(subMargin + 4),
                //labelText: widget.labelText,
                labelStyle: TextStyle(
                  color: Theme.of(context).textTheme.displayLarge!.color,
                  fontSize: mainMargin,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.isRounded! ? buttonHeight : subMarginHalf,
                  ),
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.isRounded! ? buttonHeight : subMarginHalf,
                  ),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor.withOpacity(0.7),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.isRounded! ? buttonHeight : subMarginHalf,
                  ),
                  borderSide: BorderSide(
                    color: Theme.of(context).textTheme.displayLarge!.color!,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.isRounded! ? buttonHeight : subMarginHalf,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.isRounded! ? buttonHeight : subMarginHalf,
                  ),
                  borderSide: const BorderSide(width: 1.5, color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.isRounded! ? buttonHeight : subMarginHalf,
                  ),
                  borderSide: const BorderSide(width: 2, color: Colors.red),
                ),
                //  isDense: true,
                errorStyle: const TextStyle(color: Colors.red, height: 0),
                alignLabelWithHint: true,
                prefixIcon: widget.prefix == null
                    ? null
                    : Padding(
                        padding: const EdgeInsets.only(left: subMargin),
                        child: widget.prefix,
                      ),

                suffixIcon: widget.ispassword!
                    ? IconButton(
                        onPressed: () {
                          if (widget.ispassword!) {
                            setState(() {
                              if (hidepass == true) {
                                hidepass = false;
                              } else {
                                hidepass = true;
                              }
                            });
                          }
                        },
                        splashColor: Colors.transparent,
                        icon: Icon(
                          hidepass!
                              ? Icons.no_encryption_outlined
                              : Icons.lock_outline,
                          color: widget.ispassword!
                              ? Theme.of(context).textTheme.displayLarge!.color
                              : Colors.white,
                        ),
                      )
                    : widget.suffixIcon,
              ),
            ),
          ),
        ],
      );
}
