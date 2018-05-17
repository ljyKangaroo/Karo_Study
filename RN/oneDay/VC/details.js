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
} from 'react-native';

export default class Details extends Component {
    render(){
        return(
            <ScrollView>
                <Text>详情页</Text>
                <Text>这是一个ScrollView的详情页</Text>
            </ScrollView>
        );
    }
}