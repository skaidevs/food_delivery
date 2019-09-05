import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/bloc/cartListBloc.dart';

import 'package:bloc_pattern/bloc_pattern.dart';

import 'package:food_delivery/model/foodItem.dart';

class Cart extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    List<FoodItem> foodItems;

    return StreamBuilder(
        stream: bloc.listStream,
        builder: (context, snapShort) {
          if (snapShort.data != null) {
            foodItems = snapShort.data;

            return Scaffold(
              body: SafeArea(
                child: Container(
                  child: CartBody(foodItems),
                ),
              ),
            );
          }
        });
  }
}

class CartBody extends StatelessWidget {
  final List<FoodItem> foodItems;

  CartBody(this.foodItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(35, 40, 25, 0),
      child: Column(
        children: <Widget>[
          CustomAppbar(),
          title(),
        ],
      ),
    );
  }

  Widget title() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'My',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
              ),
              Text(
                'Order',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 35),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5),
          child: GestureDetector(
            child: Icon(
              CupertinoIcons.back,
              size: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(CupertinoIcons.delete),
          ),
          onTap: () {},
        )
      ],
    );
  }
}
