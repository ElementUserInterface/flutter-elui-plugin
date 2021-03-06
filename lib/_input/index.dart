/**
 * 功能：input
 * 描述：
 * By 向堂 2019/8/27
 */

import 'package:flutter/material.dart';

class EluiInputComponent extends StatefulWidget {
  final Map data;

  final String title;

  final String value;

  final String placeholder;

  final Widget icon;

  final Widget right;

  final TextInputType type;

  final bool Internalstyle;

  final EluiInputTheme theme;

  final int maxLenght;

  final Function onChange;

  EluiInputComponent({
    Key key,
    this.data = const {},
    this.title,
    this.value,
    this.placeholder = '',
    this.icon,
    this.right,
    this.type,
    int maxLenght,
    this.Internalstyle,
    EluiInputTheme theme,
    this.onChange,
  })
      : this.maxLenght = maxLenght ?? null,
        theme = theme ?? EluiInputTheme();

  @override
  _EluiInputComponentState createState() => _EluiInputComponentState();
}

class _EluiInputComponentState extends State<EluiInputComponent> {
  String _value;

  /// 内部值长度
  int _text = 0;

  /// 输入器控制器
  TextEditingController controller = TextEditingController();

  TextInputAction textInputAction;

  _EluiInputComponentState() {
    _init();
  }

  // 初始化
  _init() {
    controller.addListener(() {
//      print("controller的监听方法：" + controller.text);
    });

    WidgetsBinding.instance.addPostFrameCallback((Duration time) {
      _setValue(widget.value);
    });
  }

  // 清除value
  void _clearValue() {
    _setValue("");
    if (widget.onChange is Function) {
      widget.onChange("");
    }
  }

  // 输入框onChange
  void _onChange(String value) {
    if (widget.onChange is Function) {
      widget.onChange({"data": widget.data, "value": value ?? ""});
    }
    setState(() {});
  }

  void _setValue(value) {
    setState(() {
      controller.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    EluiInputTheme _theme = widget.theme;

    return Container(
      padding: widget.Internalstyle != null
          ? EdgeInsets.all(0)
          : EdgeInsets.only(
        top: 15,
        bottom: 15,
        left: 20,
        right: 20,
      ),
      child: Row(
        children: <Widget>[
          if (widget.icon == null)
            Container(
              margin: EdgeInsets.only(right: 10),
              child: widget.icon,
            ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(
              widget.title ?? '',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Input(
              placeholder: widget.placeholder,
              controller: controller,
              maxLength: widget.maxLenght,
              maxLengthEnforced: true,
              textStyle: _theme.textStyle ?? TextStyle(
                color: Colors.white,
              ),
              onChange: (value_) {
                setState(() {
                  _text = value_["value"]
                      .toString()
                      .length;
                });
                _onChange(value_["value"]);
              },
            ),
          ),
          Offstage(
            offstage: _text <= 0,
            child: GestureDetector(
              child: Container(
                child: Icon(
                  Icons.cancel,
                  size: 20,
                  color: Colors.black38,
                ),
              ),
              onTap: () {
                controller.clear();
                setState(() {
                  _text = 0;
                });
              },
            ),
          ),
          if (widget.right != null) widget.right else
            Container(),
        ],
      ),
    );
  }
}

class EluiInputTheme {
  final TextStyle textStyle;

  EluiInputTheme({
    this.textStyle = const TextStyle(),
  });
}

class Input extends StatefulWidget {
  final focusNode;

  final placeholder;

  final maxLines;

  final maxLength;

  final contentPadding;

  final value;

  final type;

  final maxLengthEnforced;

  final Function onChange;

  final controller;

  final TextStyle textStyle;

  Input({
    this.focusNode,
    this.placeholder,
    this.maxLines = 1,
    this.maxLength,
    this.contentPadding = const EdgeInsets.all(0),
    this.value,
    this.type = TextInputType.text,
    this.maxLengthEnforced = true,
    this.onChange,
    this.textStyle,
    this.controller,
  });

  @override
  InputState createState() => InputState();
}

class InputState extends State<Input> {
  // 控制器
  final _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        focusNode: widget.focusNode,
        style: widget.textStyle ?? TextStyle(fontSize: 15),
        keyboardType: widget.type,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        maxLengthEnforced: widget.maxLengthEnforced,
        decoration: InputDecoration(
          hintText: widget.placeholder,
          hintStyle: widget.textStyle.copyWith(
            color: widget.textStyle.color.withOpacity(.6),
          ),
          border: InputBorder.none,
          fillColor: Colors.transparent,
          filled: false,
          hasFloatingPlaceholder: false,
          contentPadding: widget.contentPadding,
          counter: null,
          counterText: '',
        ),
        controller: widget.controller ?? _name,
        onChanged: (value_) {
          widget.onChange({"value": value_});
        },
      ),
    );
  }
}
