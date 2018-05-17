/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  StyleSheet,
  Text,
  View,
  ScrollView,
  TouchableHighlight,
  FlatList
} from 'react-native';


export default class Touchable extends Component {
    show(text){
        alert(text);
    }
    render(){
        return(
           <ScrollView>

               <TouchableHighlight
               onPress = {() =>this.show('React Native入门')}
               underlayColor = '#E1F6FF'
               >
                    <Text>
                        React Native入门
                    </Text>
               </TouchableHighlight>
           </ScrollView>
        );
    }
}

const styles = StyleSheet.create({
    flex:{
        flex: 1,
        marginTop:25
    },
    item:{
        fontSize: 18,
        marginLeft: 5,
        color: '#434343'
    }
})