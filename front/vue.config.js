// vue.config.js
module.exports = {
    /* 
      proxy設定によるCORS回避方法
      proxyはローカルで立ち上げているdevサーバーで行っているので、buildした場合はこのproxyは使えなくなるため、向き先を変えるか、サーバーで別途proxyの設定をする必要がある。
    */
    // devServer: {
    //     proxy: {
    //         "/api/": {
    //             target: process.env.USE_LOCAL_SERVER ? 'http://localhost:3000' : 'http://aaa.com',
    //         }
    //     }
    // }
};