import 'package:flutter/material.dart';

///查询输入框
class SearchInput extends StatelessWidget{

  final String placeholder;

  SearchInput({Key key,this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: MaterialSearchInput(placeholder: placeholder,),
          )
        ],
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