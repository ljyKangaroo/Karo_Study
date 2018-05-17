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
  Alert
} from 'react-native';

export default class ImportantNews extends Component {
    
    show (title){
        alert(title);
    }
    render(){
        var news = [];
        for (var i in this.props.imps) {
            var text = (
                <Text
                    key ={i}
                    onPress={this.show.bind(this,this.props.imps[i])}
                    numberOfLines={2}
                    style={styles.news_item}>
                    {this.props.imps[i]}
                </Text>
            );
            news.push(text);
        }
        return(
            <View style={styles.flex}>
                <Text style={styles.news_title}>今日要闻</Text>
                {news}
            </View>
        );
    }
}

const styles = StyleSheet.create({
    flex:{
        flex: 1
    },
    news_title:{
        fontSize:20,
        fontWeight: 'bold',
        color: '#CD1D1C' ,
        marginLeft: 10,
        marginTop: 15,
    },
    news_item:{
        marginLeft: 10,
        marginRight: 10,
        fontSize: 25,
        lineHeight: 50,

    }
});