import 'package:flutter/material.dart';

///查询输入框
class SearchInput extends StatelessWidget{

  final String placeholder;
  final VoidCallback onTap;

  SearchInput({Key key,this.placeholder,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(36.0))
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Icon(IconData(0xe61a,fontFamily: 'iconfont'),size: 16,color:Theme.of(context).accentColor,),
            ),
            Expanded(
              child: Text(this.placeholder,style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14
              ),),
            )
          ],
        ),
      ),
    );
  }
}

class MaterialSearchInput extends StatefulWidget{

  final String placeholder;
  final String errorText;

  MaterialSearchInput({Key key,this.placeholder,this.errorText});

  @override
  State<StatefulWidget> createState() {
    return MaterialSearchInputState();
  }
}

class MaterialSearchInputState<T> extends State<MaterialSearchInput>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>{

      },
      child: FormField<T>(
          builder: (FormFieldState<T> field){
            return Text(
                field.value == null?widget.placeholder:field.value.toString(),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14
              ),
            );
          },
      ),
    );
  }

}

///查询页面
class MaterialSearch<T> extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return MaterialSearchState();
  }

}

class MaterialSearchState<T> extends State<MaterialSearch>{

  TextEditingController _controller = new TextEditingController();
  
  String _textVal = '';

  @override
  void initState() {
    super.initState();

    _controller.addListener((){
      print(_controller.value.text);
      setState(() {
        _textVal = _controller.value.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.orangeAccent,
        title: TextField(
          autofocus: true,
          controller: _controller,
          style: Theme.of(context).textTheme.body1,
          decoration: InputDecoration(
             focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.greenAccent
              ),
            )
          ),
          cursorColor: Theme.of(context).textTheme.body1.color,
          cursorWidth: 2.0,
          onSubmitted: (String value){
            print('输入的值：'+value);
          },
        ),
        actionsIconTheme: IconThemeData(size: 32,color: Theme.of(context).backgroundColor),
      ),
      body: Container(
        child: Text(_textVal),
      ),
    );
  }

}