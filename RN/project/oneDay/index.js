

import React, { Component } from 'react'
import { AppRegistry, NavigatorIOS } from 'react-native'
import App from './App'


export default class OneDay extends Component {
    constructor (props) {
        super(props)
      }
    render () {
        // return (<HistoryList/>);
        return (
          <NavigatorIOS style = {{flex:1}}
            initialRoute={{
              component: App,
              title: '主页',
            }}
            renderScene={(route, navigator) => { // 用来渲染navigator栈顶的route里的component页面
                // route={component: xxx, name: xxx, ...}， navigator.......route 用来在对应界面获取其他键值
                return <route.component navigator={navigator} {...route} {...route.passProps}/>// {...route.passProps}即就是把passProps里的键值对全部以给属性赋值的方式展开 如：test={10}
              }}
            />
        )
      }
}
AppRegistry.registerComponent('oneDay', () => OneDay);
