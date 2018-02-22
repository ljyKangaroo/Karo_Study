/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  PixelRatio,
  Alert,
  ScrollView
} from 'react-native';
import Header from './JS/header';
import List from './JS/list';
import ImportantNews from './JS/ImportantNews';
import Details from './VC/details';
import SearchPage from './VC/SearchPage';
import Touchable from './VC/Touchable';
import ImagePage from './VC/ImagePage';
const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' +
    'Cmd+D or shake for dev menu',
  android: 'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});



 class App extends Component {

  _goTo (){
    this.props.navigator.push({
      component: Details,
      title: '详情',
    })
  }

  _goSearch (){
    this.props.navigator.push({
      component: SearchPage,
      title: '搜索',
    })
  }
 
  _goTouch (){
    this.props.navigator.push({
      component:Touchable,
      title: '高亮'
    })
  }
  _goImage (){
    this.props.navigator.push({
      component:ImagePage,
      title: '图片'
    })
  }
  render() {
    return (
      <ScrollView>
        <Header></Header>

        <View style={styles.container}>
          
          <View style={[styles.item, styles.center]}>  
            
            <Text style={styles.font} onPress ={() => this._goTo()}>酒店</Text>
          </View>
          <View style={[styles.item, styles.lineLeftRight]}>
              <View style={[styles.center, styles.flex, styles.lineCenter]}>
                <Text style={styles.font} onPress ={() => this._goSearch()}>搜索</Text>
              </View>
              <View style={[styles.center, styles.flex]}>
                <Text style={styles.font} onPress ={() => this._goTouch()}>Touchable</Text>
              </View>
          </View>
          <View></View>
          <View style={styles.item}>
              <View style={[styles.center, styles.flex, styles.lineCenter]}>
                <Text style={styles.font} onPress ={() =>this._goImage()}>图片</Text>
              </View>
              <View style={[styles.center, styles.flex]}>
                <Text style={styles.font}>客栈，公寓</Text>
              </View>
          </View>
        </View>

        <View>
          <List title='第一行'></List>
          <List title='第二行'></List>
          <List title='第三行'></List>
          <List title='第4️⃣行'></List>
        </View>

        <ImportantNews 
        imps={[
          '123',
          '123',
          '134',
          'dsfgdsf'
        ]}
        >

        </ImportantNews>
        
      </ScrollView>
    );
  }
}

const styles = StyleSheet.create({
  // container: {
  //   flex: 1,
  //   justifyContent: 'center',
  //   alignItems: 'center',
  //   backgroundColor: '#F5FCFF',
  // },
  // welcome: {
  //   fontSize: 20,
  //   textAlign: 'center',
  //   margin: 10,
  // },
  // instructions: {
  //   textAlign: 'center',
  //   color: '#333333',
  //   marginBottom: 5,
  // },
  container:{
    marginTop:25,
    marginLeft:5,
    marginRight:5,
    height:84,
    padding:2,
    borderWidth: 1,
    borderColor: '#FF0067',
    flexDirection: 'row'
  },
  item:{
    flex: 1,
    height:80,
   
  },
  center:{
    justifyContent: 'center',
    alignItems: 'center'
  },
  flex:{
    flex: 1,
    // backgroundColor: '#000000'
  },
  font:{
    color: '#000000',
    fontSize: 16,
    fontWeight: 'bold'
  },
  lineLeftRight:{
    borderLeftWidth: 1/PixelRatio.get(),
    borderRightWidth: 1/PixelRatio.get(),
    borderColor: '#000000'
  },
  lineCenter:{
    borderBottomWidth: 1/PixelRatio.get(),
    borderColor: '#000000'
  }
});
module.exports = App;

