import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/redux/actions.dart';
import 'package:uni/utils/constants.dart' as Constants;

class ScheduleTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return createTopBar(context);
  }

  Widget createActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Adicionar Eventos!!!'),
                content: Container(
                  height: 200.0,
                  width: 100.0,
                ),
                actions: [
                  TextButton(
                      child: Text('Cancelar'),
                      onPressed: () => Navigator.pop(context))
                ]);
          }), //Add FAB functionality here
      tooltip: 'Adicionar widget',
      child: Icon(Icons.add),
    );
  }

  Widget createTopBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
      child: Stack(alignment: Alignment.center, children: <Widget>[
        Center(
            child: Text(
          Constants.navSchedule,
          style:
              Theme.of(context).textTheme.headline3.apply(fontSizeFactor: 1.5),
        )),
        Container(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
                onTap: () => StoreProvider.of<AppState>(context).dispatch(
                    SetSchedulePageEditingMode(!this.isEditing(context))),
                child: Text(
                    this.isEditing(context) ? 'Concluir Edição' : 'Editar',
                    style: Theme.of(context).textTheme.caption)))
      ]),
    );
  }

  bool isEditing(context) {
    final bool result = StoreProvider.of<AppState>(context)
        .state
        .content['schedulePageEditingMode'];
    if (result == null) return false;
    return result;
  }
}