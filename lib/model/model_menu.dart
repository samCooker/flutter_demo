
class MenuData {
  String name;
  String url;
  String icon;
  String color;

  MenuData(this.name,this.url);

  MenuData.fromJson(Map<String, dynamic> json)
      :name=json['name'], url=json['url'], icon=json['icon'],color=json['color'];

  int get iconHex{
    if(icon!=null&&icon.trim()!=''){
      // todo test
      return 0xe61f;
    }
    return 0xe61f;
  }
}