package com.lianyikai.bookstore.test;




/**
 * 书店，最终需要实现买书功能
 *
 * 过程：
 * 1.先展示首页(首页上，显示书籍信息列表;这里为了演示上传下载，所以直接添加一个增加的超链接,后续完成增加书籍功能);
 * 		关于首页，需要实现分页，多条件查询
 * 2.在首页上,用户可以点击书名，进入书籍详情页，查看书籍详情;
 * 		在详情页上，应该有一个立即购买按钮（也可以有一个加入购物车按钮），点击购买，应该进入订单处理页面
 * 		如果要实现订单，必须在数据库建表，保存订单信息;
 * 		数据库如果要建表，建议：  订单表和订单详情表
 * 3.详情页上，点击立即购买，进入购买页
 * 		点击购买的时候，要求加入拦截器，做登录拦截，要求必须登录成功才可以进入购买页;
 * 		在购买页上，需要展示：
 * 			a. 书籍信息（至少有书籍名字， 书籍价格。。）
 * 			b. 展示书籍的库存数量
 * 			c. 当前用户所拥有的账号列表（可以是一个下拉列表框），用户自行选择其中一个账户，通过ajax,查询选中账户的余额，并在页面展示出来
 * 			d. 还应该有一个支付按钮
 * 4.点击支付，实现购买,这里只要求一次能够成功购买一本书即可;
 * 		购买成功后，再跳转到书籍列表页（也就是首页）;
 *
 *
 * @author Administrator
 *
 */
public class Test {

}