import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isFormShow = false;
  void _clickChart(){}
  void _clickAccount(){}
  void _clickFloatingActionButton(){
    setState(() {
      _isFormShow = !_isFormShow;
    });
  }
  String _number = "0.0";
  String _remark = "";
  String _type = "选择分类";
  String _date = "选择日期";
  String _mode = "num";
  void _selectDate(){}
  void _selectType(){}
  void _numOnTap(v){debugPrint(v);}
  void _remarkOnChange(v){setState(() {
    _remark = v;
  });}




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
            child: _isFormShow?FormBottom(_date,_number,_remark,_type,_mode,_selectDate,_selectType,_numOnTap,_remarkOnChange):NormalBottom(),
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
                color: Colors.grey[300],
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
  final VoidCallback selectType;
  final remarkOnChange;
  final numOnTap;
  FormBottom(
    this.date,
    this.number,
    this.remark,
    this.type,
    this.mode,
    this.selectDate,
    this.selectType,
    this.numOnTap,
    this.remarkOnChange,
  );
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
                onPressed: (){},
                icon: Icon(
                  Icons.add_photo_alternate,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "备注",
                    border: InputBorder.none
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
              SizedBox(width: 16.0,),
              Expanded(
                child: FlatButton(
                  onPressed: (){},
                  child: Text(
                    type,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)
                  )
                )
              ),
              SizedBox(width: 8.0,),
              Expanded(
                  child: FlatButton(
                      onPressed: (){},
                      child: Text(
                        date,
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)
                      )
                  )
              ),
              SizedBox(width: 10.0,),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      number,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 24.0,),
            ],
          ),
          Divider(),
          // 数字键盘
          Expanded(
            child: Row(
              children: <Widget>[
                Column()
              ],
            ),
          )
        ],
      ),
    );
  }
}





