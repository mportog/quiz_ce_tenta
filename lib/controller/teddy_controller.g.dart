// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teddy_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TeddyStore on _TeddyStoreBase, Store {
  final _$teddyControlAtom = Atom(name: '_TeddyStoreBase.teddyControl');

  @override
  FlareControls get teddyControl {
    _$teddyControlAtom.reportRead();
    return super.teddyControl;
  }

  @override
  set teddyControl(FlareControls value) {
    _$teddyControlAtom.reportWrite(value, super.teddyControl, () {
      super.teddyControl = value;
    });
  }

  final _$_TeddyStoreBaseActionController =
      ActionController(name: '_TeddyStoreBase');

  @override
  String _getAnimationName(TeddyAnimations anim) {
    final _$actionInfo = _$_TeddyStoreBaseActionController.startAction(
        name: '_TeddyStoreBase._getAnimationName');
    try {
      return super._getAnimationName(anim);
    } finally {
      _$_TeddyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTeddyAnimation(TeddyAnimations animation) {
    final _$actionInfo = _$_TeddyStoreBaseActionController.startAction(
        name: '_TeddyStoreBase.setTeddyAnimation');
    try {
      return super.setTeddyAnimation(animation);
    } finally {
      _$_TeddyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
teddyControl: ${teddyControl}
    ''';
  }
}
