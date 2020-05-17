import '../bloc/flashcard_bloc.dart';
import '../bloc/state/flashcard_state.dart';
import '../constants.dart';
import '../styles/app_styles.dart';
import '../widget/appbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Flashcard extends StatefulWidget {
  
  @override
  _FlashcardState createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  final _bloc = FlashcardBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _bloc,
      child: FlashcardWidget()
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }
}

class FlashcardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(!context.bloc<FlashcardBloc>().state.isQ) {
      return FlashcardFrontWidget();
    } else {
      return FlashcardBackWidget();
    }
  }
  
}

class FlashcardFrontWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Flashcard'),
      body: BlocBuilder(
        bloc: BlocProvider.of<FlashcardBloc>(context),
        builder: (context, FlashcardState state) {
          return Container(
            margin: EdgeInsets.all(20),
            decoration: AppDeco.BOX_BORDER_SHADOW,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: AutoSizeText(
                      'Aka', 
                      style: AppText.MAX_TEXT,
                      minFontSize: 18
                    )
                  )  
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.help_outline, size: 75, color: TERTIARY_COL),
                    ],
                  ),
                )
              ],
            )
          );
        })
    );
  }
}
class FlashcardBackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Flashcard'),
      body: BlocBuilder(
        bloc: BlocProvider.of<FlashcardBloc>(context),
        builder: (context, FlashcardState state) {
          return Container(
            margin: EdgeInsets.all(20),
            decoration: AppDeco.BOX_BORDER_SHADOW,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: AutoSizeText(
                      'The answer to that was...', 
                      style: AppText.MAX_TEXT,
                      minFontSize: 18
                    ),
                  )  
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.check, size: 75, color: POS_COL),
                      Icon(Icons.clear, size: 75, color: NEG_COL),
                    ],
                  ),
                )
              ],
            )
          );
        })
    );
  }
}