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
  TextInput,
  PixelRatio
} from 'react-native';
var onePT = 1/PixelRatio.get();

export default  class SearchPage extends Component {
    
    constructor (...args) {
        super(...args)
        this.state = ({
         show:false,

        })
      }
    
    getValue (text){
        var value = text;
        this.setState({
            show:true,
            value: value
        })
    }

    hide(val){
        this.setState({
            show:false,
            value:val
        })
    }

    render(){
       
        
        return(
            <ScrollView style={styles.flex}>
                <View style={styles.flexDirection}>
                    <TextInput
                        style={styles.input} 
                        placeholder = '请输入关键字'
                        onEndEditing = {this.hide.bind(this, this.state.value)}
                        value={this.state.value}
                        onChangeText = {(text) =>this.getValue(text)}
                        returnKeyType ='search'/>
                </View>
       
                <View style={styles.btn}>
                    <Text
                        onPress = {this.hide.bind(this, this.state.value)}
                        >
                    搜索</Text>
                </View>
                {this.state.show?
                    <View style={styles.flex}>
                        <Text
                            onPress = {this.hide.bind(this, this.state.value+'庄')}
                            style = {styles.btn}
                            numberOfLines = {1} 
                        >{this.state.value}庄</Text>
                    </View>
                :null
                }

            </ScrollView>
        );
    }
}

const styles = StyleSheet.create({
    flex:{
        flex: 1
    },
    flexDirection:{
        flexDirection: 'row'
    },
    topStatus:{
        marginTop: 25,
    },
    input:{
        height:45,
        borderWidth: 1,
        marginLeft: 5,
        paddingLeft:5,
    },
    btn:{
        width:55,
        marginLeft: 50,
        marginRight: 5,
        backgroundColor: '#23BEFF',
        height: 45,
        justifyContent: 'center',
        alignItems: 'center'
    }
})