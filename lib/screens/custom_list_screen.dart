import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../widgets/side_panel.dart';
import '../widgets/custom_dare_item.dart';

import '../providers/dares.dart';
import '../providers/dare.dart';

class CustomListScreen extends StatefulWidget {
  final String type;

  CustomListScreen(this.type);

  @override
  _CustomListScreenState createState() => _CustomListScreenState();
}

class _CustomListScreenState extends State<CustomListScreen> {
  // final _form = GlobalKey<FormState>();
  TextEditingController _addValue;
@override
  void initState() {
    _addValue = new TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dares = Provider.of<Dares>(context);
    final deviceSize = MediaQuery.of(context).size;
    String capType = '${widget.type[0].toUpperCase()}${widget.type.substring(1)}';

    // List<Dare> _listItems; 
    // if(widget.type == 'dare') {
    //   _listItems = dares.dares;
    // }
    // if(widget.type == 'success') {
    //   _listItems = dares.successes;
    // }
    // if(widget.type == 'punishment') {
    //   _listItems = dares.punishments;
    // }
    return Scaffold(
      appBar: AppBar(  

      ),
      // drawer: SidePanel('customize'),
      body: FutureBuilder<List<Dare>>(
      future: dares.fetchDares('1', widget.type),
      builder: (BuildContext context, AsyncSnapshot<List<Dare>> snapshot) {
        if(!snapshot.hasData) {
          return Text('Loading...');
        } 
        return Container( 
        height: deviceSize.height,
        child: Column(  
          children: <Widget>[
            // Form( 
            //   key: _form,
            //   child: ,
            // )
            TextField(
              autocorrect: true,
              decoration: InputDecoration(
                labelText: capType
              ),
              controller: _addValue,
            ),
            SizedBox(height: 10,),
            RaisedButton( 
              child: Text('Add ' + widget.type),
              onPressed: () {
                if(_addValue.text.length < 5 || _addValue.text.isEmpty) {
                  return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog( 
                      content: Text('${capType} must be at least five characters'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Dismiss'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    )
                  );
                }
                if(_addValue.text.length > 150) {
                  return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog( 
                      content: Text('${capType} must be less than 150 characters'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Dismiss'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    )
                  );
                }
                dares.saveDare(_addValue.text, widget.type, '1');
              },
            ),
            _buildDareList(snapshot.data)
          ],
        ),
      );
      })
    );
  }
}

ListView _buildDareList(List<Dare> _itemList) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: _itemList.length,
    itemBuilder: (ctx, ind) => CustomDareItem(_itemList[ind]),
  );
}

