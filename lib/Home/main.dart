import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isFormShow = false;
  void _clickChart(){
    debugPrint("Chart is clicked");
  }
  void _clickAccount(){
    debugPrint("Account is clicked");
  }
  void _clickFloatingActionButton(){
    setState(() {
      _isFormShow = !_isFormShow;
    });
  }
  String _account = "工资卡";
  String _number = "0";
  String _remark = "";
  String _type = "零食...";
  String _date = "04/06";
  String _mode = "num";
  void _selectDate(){
    debugPrint("Clicked Date Selector");
  }
  void _selectMode(v){
    debugPrint("Clicked Mode Selector : $v");
  }
  void _numOnTap(v){
    var num = _number;
    if(v == "x"){
      if(num.length<=1){
        num = "0";
      }else{
        num = num.substring(0,num.length-1);
      }
    }
    else if(v == "C"){
      num = "0";
    }
    else if(v == "."){
      if(num.indexOf(".")==-1){
        num+=v;
      }
    }
    else{
      if(num == "0"){
        num = v;
      }else{
        if(num.indexOf(".")!=-1&&num.length-num.indexOf(".")>=3){

        }else{
          num += v;
        }

      }

    }
    setState(() {
      _number = num;
    });
  }
  void _remarkOnChange(v){setState(() {
    _remark = v;
  });
  debugPrint(_remark);
  }
  void _selectRemarkImg(){
    debugPrint("Clicked Remark Img Icon");
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_box,
              color: Colors.grey[300],
            ),
            onPressed: _clickAccount
          ),
          IconButton(
            icon: Icon(
              Icons.pie_chart,
              color: Colors.grey[300],
            ),
            onPressed: _clickChart,
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _clickFloatingActionButton,
        elevation: 2.0,
        highlightElevation: 0.5,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          _isFormShow?Icons.check:Icons.add,
          color: Theme.of(context).backgroundColor,
          size: 40.0,
        ),
        shape: CircleBorder(
          side: BorderSide(
            width: 4.0,
            color: Theme.of(context).backgroundColor
          )
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
          color: Theme.of(context).backgroundColor,
          child:Container(
            height: _isFormShow?350.0:50.0,
            child: _isFormShow?FormBottom(_account,_date,_number,_remark,_type,_mode,_selectDate,_selectMode,_numOnTap,_remarkOnChange,_selectRemarkImg):NormalBottom(),
          )

      ),
    );
  }
}

class NormalBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 16.0,),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 16.0),
              height: 30.0,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16.0)
              ),
              child: Text(
                "亲爱的，点击右边的加号试试吧...",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
                ),
              ),
            ),
          ),
          SizedBox(width: 90.0,)
        ],
      ),
    );
  }
}

class FormBottom extends StatelessWidget {
  final String number;
  final String remark;
  final String type;
  final String date;
  final String mode;
  final VoidCallback selectDate;
  final selectMode;
  final remarkOnChange;
  final numOnTap;
  final selectRemarkImg;
  final account;
  FormBottom(
      this.account,
    this.date,
    this.number,
    this.remark,
    this.type,
    this.mode,
    this.selectDate,
    this.selectMode,
    this.numOnTap,
    this.remarkOnChange,
    this.selectRemarkImg
  );

  Widget generate_num_key_bord(BuildContext context){
    var keys = [["1","4","7","."],["2","5","8","0"],["3","6","9","00"],["x","C"]];
    List<Widget> widget_list = [];
    for(var i = 0;i<keys.length;i++){
      List<Widget> row_items = [];
      for(var j = 0;j<keys[i].length;j++){
        var row_item = Expanded(
          flex: i==3&&j==1?2:1,
          child: FlatButton(
            child: i==3&&j==0?Icon(
              Icons.backspace,
              color: Colors.grey,
            ):Text(
              keys[i][j],
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0)
            ),
            color: Colors.grey[200],
            onPressed: (){
              numOnTap(keys[i][j]);
            },
          ),
        );
        row_items.add(row_item);
        row_items.add(SizedBox(height: 8.0,));
      }
      var col_item = Expanded(
        child: Column(

          children: row_items,
        ),
      );
      widget_list.add(col_item);
    }
    return Row(
      children: widget_list
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 备注
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: selectRemarkImg,
                icon: Icon(
                  Icons.add_photo_alternate,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: TextField(
                  onChanged: remarkOnChange,
                  decoration: InputDecoration(
                    labelText: "备注",
                    labelStyle: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 16.0
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide.none
                    )
                  ),
                ),
              ),
              SizedBox(width: 80.0,)
            ],
          ),
          Divider(),
          // 数字显示、类型、日期
          Row(
            children: <Widget>[
              SizedBox(width: 8.0,),
              Expanded(
                flex: 1,
                child: FlatButton(
                  onPressed: (){
                    selectMode("type");
                  },
                  child: Text(
                    type,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  color: Colors.redAccent[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)
                  )
                )
              ),
              SizedBox(width: 4.0,),
              Expanded(
                flex: 1,
                  child: FlatButton(
                      onPressed: selectDate,
                      child: Text(
                        date,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      color: Colors.blueAccent[100],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)
                      )
                  )
              ),
              SizedBox(width: 4.0,),
              Expanded(
                  flex: 1,
                  child: FlatButton(
                      onPressed: (){
                        selectMode("account");
                      },
                      child: Text(
                        account,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      color: Colors.orangeAccent[100],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)
                      )
                  )
              ),
              SizedBox(width: 16.0,),
              Expanded(
                flex: 2,
                child: Text(
                  number.substring(number.length>12?number.length-12:0),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 22.0,
                  ),
                )
              ),
              SizedBox(width: 10.0,),
            ],
          ),
          Divider(),
          // 数字键盘
          Expanded(
            child: generate_num_key_bord(context)
          )
        ],
      ),
    );
  }
}





