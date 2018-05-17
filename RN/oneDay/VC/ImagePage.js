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
  Image,
  TouchableOpacity
} from 'react-native';

var imags = [
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1513921558540&di=49c1439e7ecedc60b2b276d8048b05f8&imgtype=0&src=http%3A%2F%2Fn1.itc.cn%2Fimg8%2Fwb%2Frecom%2F2016%2F05%2F23%2F146397295100845261.PNG',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1513921570425&di=92c3327953329cee0e4cf4118ec413b6&imgtype=0&src=http%3A%2F%2Fwww.itsource.cn%2Fimg%2FfiveCourse%2Fh5%2Fcourse_2.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1513921598394&di=4a14cfe33ede4dfacdb8dcab85806972&imgtype=0&src=http%3A%2F%2Fweitaoc.com%2Fwp-content%2Fuploads%2F2015%2F11%2Ffb273ef29cf057a236290c437f325ef1.png'
  ]

export default class ImagePage extends Component {
    constructor (...args) {
        super(...args)
        var imgs = imags
        this.state = ({
         imgs:imgs,
         count: 0

        })
      }

      _goNext(){
          var count = this.state.count
          count ++;
          if(count <imags.length){
              this.setState({
                  count:count
              })
          }
      }

      _goPreview(){
          var count = this.state.count
          count --;
          if(count >= 0){
              this.setState({
                  count:count
              })
          }
      }

    render(){
        return(
            <ScrollView>
                <View style={styles.flex}>
                    <View style={styles.images}>
                        <Image
                            style={styles.img}
                            source={{uri:this.state.imgs[this.state.count]}}   
                            resizeMode = 'contain'
                        />
                    </View>
                    <View style={styles.btns}>
                    <TouchableOpacity onPress = {()=>this._goPreview()}>
                            <View style={styles.btn}>
                                <Text>上一张</Text>
                            </View>
                    </TouchableOpacity>

                    <TouchableOpacity onPress = {()=>this._goNext()}>
                            <View style={styles.btn}>
                                <Text>下一张</Text>
                            </View>
                    </TouchableOpacity>
                    </View>

                
                </View>
            </ScrollView>
        );
    }
}

const styles = StyleSheet.create({
    flex:{
        flex: 1,
        alignItems: 'center'
    },
    images:{
        borderWidth: 1,
        width: 300,
        height: 200,
        borderRadius: 5,
        justifyContent: 'center',
        alignItems: 'center'
    },
    img:{
        height: 150,
        width: 200
    },
    btns:{
        flexDirection: 'row',
        justifyContent: 'center',
        marginTop: 20
    },
    btn:{
        width: 60,
        height: 30,
        borderColor: '#0089FF',
        borderWidth: 1,
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 3,
        marginRight: 20
    }
})