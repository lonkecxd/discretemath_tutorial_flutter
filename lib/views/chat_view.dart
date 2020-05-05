import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/views/default_extra_item.dart';
import 'package:tutorial/views/input_widget.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'dart:ui' as ui;
class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {

  ChatType currentType;
  TextEditingController ctl = TextEditingController();
  List<Map<String, dynamic>> _messages = [
  {'sender':'cxd','type':'text','content': 'hello'},
  {'sender':'ccnu','type':'text','content': 'hi'},
  {'sender':'ccnu','type':'img','content': 'assets/add.png'},
  ];
  String cur_username = 'cxd';
  
  @override
  void initState() {
    super.initState();
    ctl.addListener(onValueChange);
  }

  void dispose() {
    ctl.removeListener(onValueChange);
    ctl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ChangeChatTypeNotification>(
      onNotification: _onChange,
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: Container(
          child: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child:Column(
                        children: [
                          SizedBox(height: 25.0,),
                          Column(
                            children:  _messages.map((e) =>
                                cur_username==e['sender']? Bubble(
                                  margin: BubbleEdges.only(top: 10),
                                  child: e['type']=='text'?Text(e['content'],style: TextStyle(color: Colors.black),): Image.asset(e['content']),
                                  color: Color.fromRGBO(225, 255, 199, 1.0),
                                  alignment: Alignment.topRight,
                                  nip: BubbleNip.rightTop,
                                ):e['sender']=='_notice'?Bubble(
                                  margin: BubbleEdges.only(top: 10),
                                  alignment: Alignment.center,
                                  color: Color.fromRGBO(212, 234, 244, 1.0),
                                  child:e['type']=='text'?Text(e['content'],textAlign:TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 16.0),): Image.asset(e['content']),
                                ):Bubble(
                                  margin: BubbleEdges.only(top: 10),
                                  alignment: Alignment.topLeft,
                                  nip: BubbleNip.leftTop,
                                  child:e['type']=='text'?Text(e['content'],style: TextStyle(color: Colors.black),): Image.asset(e['content']),
                                )
                            ).toList(),
                          ),
                          SizedBox(height: 25.0,)
                        ],
                      ),
                    ),
                ),
                InputWidget(
                  controller: ctl,
                  extraWidget: DefaultExtraWidget(),
                  onSend: (value){
//                    ctl.clear();
                    // TODO submit dialogflow
                    print("send text $value");
                    _messages.add({'sender':cur_username,'type':'text','content':value.toString()});
                    setState(() {});
                    _dialogFlowResponse(value.toString());
                  },
                ),
              ],
          ),
        ),
      )
    );
  }

  void onValueChange() {
  }

  bool _onChange(ChangeChatTypeNotification notification) {
    setState(() {
      this.currentType = notification.type;
    });
    return true;
  }

  void _dialogFlowResponse(String query)  async{
      AuthGoogle authGoogle = await AuthGoogle(fileJson: "assets/flutterapp-cxd-83c9f1a2b07f.json").build();
      Dialogflow dialogflow = Dialogflow(
        authGoogle: authGoogle,
        language: Language.chineseSimplified
      );
      AIResponse response = await dialogflow.detectIntent(query);
      String message = response.getMessage()??response.getMessage();
      String intent = response.queryResult.intent.displayName;
      String entity = response.queryResult.parameters['entity'];
      print(message);
      if (intent!=null || entity!=null)
        _messages.add({'sender':'_notice','type':'text','content':"${intent}   ${entity}"});
      if (message!=null)
        _messages.add({'sender':'robot','type':'text','content':message==null?"":message});
      setState(() {});
  }

}
