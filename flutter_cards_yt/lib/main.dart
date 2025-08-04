import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() {
  runApp(const MaterialApp(
    home: QuoteList(),
    ));
}

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(text: "The only limit to our realization of tomorrow is our doubts of today.", author: "Franklin D. Roosevelt"),
    Quote(author: "Charles R. Swindoll" , text:"Life is 10% what happens to us and 90% how we react to it."),
    Quote(text: "The purpose of our lives is to be happy.", author: "Dalai Lama"),
    Quote(text: "Get busy living or get busy dying.", author: "Stephen King"),
    Quote(text: "You have within you right now, everything you need to deal with whatever the world can throw at you.", author: "Brian Tracy"),
  ];

  // This function is used to create a widget for each quote
  // Widget quoteTemplate(quote){
  //   return QuoteCard(quote: quote);
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Awesome Quotes",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600
          ),
          ),
        centerTitle: true,
        backgroundColor: Colors.purple[700],
      ),
      body: ListView(
        children: quotes.map((quote)=> QuoteCard(
          quote: quote,
          delete: (){
            setState((){
              quotes.remove(quote);
            });
          },
          )).toList(),
      )
    );
  }
}

