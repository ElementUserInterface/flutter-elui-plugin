import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/elui.dart';
import 'package:flutter_plugin_elui_example/router.dart';

class indexPage extends StatefulWidget {
  @override
  _indexpageState createState() => _indexpageState();
}

class _indexpageState extends State<indexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiHeadComponent(context: context, title: '首页', isBack: false,),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Elui', style: TextStyle(
                    fontSize: 40,
                    color: Colors.blue
                  )),
                  Text('Flutter UI库', style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue
                  ))
                ],
              ),
            ),
            EluiCellComponent(
              title: "head",
              label: "头",
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return headPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "cell",
              label: "单元格",
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return cellPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "tag",
              label: "标签",
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return tagPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "button",
              label: "按钮",
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return buttonPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "message",
              label: "全局消息",
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return messagePage();
                }));
              },
            ),
            EluiCellComponent(
              title: "input",
              label: "输入框",
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return inputPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "textarea",
              label: "多行输入框",
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return textareaPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "img",
              label: "图片",
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return imgPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "numlndicator",
              label: "数字指示器",
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return numlndicatorPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "tip",
              label: "提示",
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return tipPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "popup",
              label: "弹窗",
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return popupPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "radio",
              label: "单选",
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return radioPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "checkbox",
              label: "复选",
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return checkboxPage();
                }));
              },
            ),
            EluiCellComponent(
              title: "countdown",
              label: "倒计时",
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return countdownPage();
                }));
              },
            ),
          ],
        ));
  }
}
