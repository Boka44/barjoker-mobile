import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dares.dart';
import '../providers/dare.dart';

class CustomDareItem extends StatefulWidget {
  final Dare item;

  CustomDareItem(this.item);

  @override
  _CustomDareItemState createState() => _CustomDareItemState();
  
}

class _CustomDareItemState extends State<CustomDareItem> {
  TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: widget.item.message);
  }
  @override
  Widget build(BuildContext context) {
    final dares = Provider.of<Dares>(context);
    return Dismissible(
      key: ValueKey(widget.item.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (DismissDirection direction) {
        dares.removeDare(widget.item.id);
      },
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Are you sure?'),
                content: Text(
                  'Do you want to delete the ${widget.item.type}?',
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.of(ctx).pop(false);
                    },
                  ),
                  FlatButton(
                    child: Text('Yes'),
                    onPressed: () {
                      Navigator.of(ctx).pop(true);
                    },
                  ),
                ],
              ),
        );
      },
      child: ListTile(
        leading: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: Text('Edit ' + widget.item.type),
                    content: TextField( 
                      minLines: 1,
                      maxLines: 5,
                      controller: _controller
                    ),
                    actions: <Widget>[
                      RaisedButton(
                        color: Colors.white,
                        child: Text('Save'),
                        onPressed: () {
                          dares.editDare(widget.item.id, _controller.text);
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
            );
          },
        ),
        title: Text(
          widget.item.message,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}