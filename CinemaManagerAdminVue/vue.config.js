/*
 * @Description: 
 * @Author: Rabbiter
 * @Date: 2023-02-24 18:08:34
 */
module.exports = {
    devServer: {
        port: 9233
    },
    publicPath:process.env.NODE_ENV === 'production' ? '/电影院后台管理' : '/'
}
