
class TodoModel{
  final int id;
  final String title;
  bool check;

  TodoModel({this.id, this.title, this.check});

  factory TodoModel.fromJson(Map<String, dynamic> json){
    return TodoModel( id : json['id'],
        title : json['title'],
        check : json['progress']
    );
  }

}