//
//  Sql.h
//  mhao
//
//  Created by xjk on 6/4/15.
//  Copyright (c) 2015 ailami. All rights reserved.
//

#ifndef mhao_Sql_h
#define mhao_Sql_h


#pragma mark table sql

// table MessageSummary
#define kTableMsgSummary @"create table if not exists MessageSummary(" /*短信会话*/ \
"id integer primary key autoincrement not null," /*短信ID*/ \
"userId integer(11)," /*登录用户ID*/ \
"virtualNumber varchar(20)," /*虚拟号码*/ \
"fromNumber varchar(20)," /*来源号码*/ \
"content varchar(512)," /*内容*/ \
"lastMsgId integer," /*会话的最后一条消息id*/ \
"createTime timestamp," /*创建时间 服务器传来的时间*/ \
"missCount integer," /*未读短信条数*/ \
"isDelete integer," /*是否进行了标记删除*/ \
"parentId integer)" /*会话对方的最后一条消息id，用户判断短信下发限制用*/

// table MessageBean
#define kTableMessageBean @"create table if not exists MessageBean(" /*短信*/ \
"id integer not null primary key," /*是服务端生成的短信的id */ \
"userId integer," /*登录用户id*/ \
"fromNumber varchar(20)," /*来源号码*/ \
"toNumber varchar(20)," /*接收号码*/ \
"content varchar(1024)," /*内容*/ \
"createTime bigint," /*服务端传来的时间*/ \
"parentId integer," /*1 发送  2 接收*/ \
"sendStatus integer," /*1 发送  2 接收*/ \
"isDelete integer," /*1 发送  2 接收*/ \
"canReducePoint integer," /* 0 不允许扣密点 1 允许 */ \
"hideMsg integer," /* 106类的短信将进行短信内容隐藏进行推送  (1:隐藏, 0:未隐藏)*/ \
"readStatus integer)" /*发送状态 1 待发送，2 成功，3 失败（旧：0 初始化 1 成功 -1 失败）； 查看状态 1 未读，2已读（旧：0 未读 1 已读）*/

// table MhaoContacts
#define kTableMhaoContacts @"create table if not exists MhaoContacts(" /**/ \
"id integer not null primary key," /*id */ \
"userId integer," /*登录用户id*/ \
"name varchar(64)," /*名称*/ \
"company varchar(64)," /*公司*/ \
"job varchar(64)," /*工作*/ \
"number varchar(20)," /*号码*/ \
"remark varchar(512)," /*备注*/ \
"imagePath varchar(64))" /* iconpath*/

// table secretary
#define kTableSecretary @"create table if not exists secretary(" /*小秘书*/ \
"id integer primary key autoincrement not null," /*id*/ \
"type integer," /*类型 1，发出，2 接收（旧： 0 接收的  1发出的）*/ \
"content varchar(2048))" /*内容*/

// table num_location
#define kNumberLocation @"create table if not exists ProvinceBean(" /*号码归属地*/ \
"number varchar(20)," /*号码*/ \
"city varchar(12)," /*城市*/ \
"province varchar(12)," /*省份*/ \
"type varchar(12))" /*运营商*/


//********  2.x 关系密号    ********//
// table relation
#define kRelationMobile @"create table if not exists relation(" /*关系密号*/ \
"id integer primary key autoincrement not null," /*id*/ \
"mobile varchar(20)," /*对方手机号*/ \
"virtual_number varchar(20)," /*虚拟号码*/ \
"nickname varchar(14)," /*昵称*/ \
"spell varchar(42)," /*拼音*/ \
"on_off integer," /*关系密号开关机 (0 关机, 1 开机)*/ \
"status integer)" /*激活状态 ？？？？？？？？？？？枚举值*/


//********    3.0 密友     ********//
// table CloseFriendVmBindBean
#define kTableCloseFriendVmBindBean @"create table if not exists CloseFriendVmBindBean(" /*密友*/ \
"tm varchar(20)," /*绑定的号码*/ \
"seqId integer," /*接入商平台生成的标示*/ \
"endTime integer," /*当设置时间为 x(x 大于 0 且 小于 1440)时,绑定时间为 X 分钟,超过指定时间自动释放*/ \
"status integer," /*状态 (上面)*/ \
"onoff integer," /**/ \
"onOffStatus integer," /**/ \
"nickName varchar(64)," /**/ \
"nick varchar(64)," /**/ \
"userId integer," /**/ \
"initiative integer," /**/ \
"spSeqId varchar(64)," /**/ \
"isAddRelationship integer," /**/ \
"relationshipEndTime integer," /**/ \
"isDelete integer," /**/ \
"vm varchar(20)," /**/ \
"customizeIconPath varchar(64)," /**/ \
"remark varchar(512))" /**/


//table InsideMsg
#define KInsideMsg @"create table if not exists InsideMsg(" /*站内信*/ \
"iconPath varchar(64)," /*图片*/ \
"title varchar(64)," /*标题*/ \
"beginTime varchar(20)," /*beginTime*/ \
"endTime varchar(20)," /*endTime*/ \
"intro varchar(64)," /*简介*/ \
"content varchar(64)," /*内容*/ \
"linkUrl varchar(64))" /*linkUrl*/


// table BlackList
#define kBlackMobile @"create table if not exists BlackList(" /*用户黑名单*/ \
"id integer primary key autoincrement not null," /*id*/ \
"number varchar(20),"/* 号码 */ \
"province varchar(20)," /* 省份 */ \
"city varchar(20)," /*城市*/ \
"type varchar(20))" /*类型*/ \

// table CallRecord
#define kCallRecord @"create table if not exists CallRecord("/*通话记录*/\
"id integer primary key autoincrement not null," /*id*/ \
"spId integer," /*spId 商户ID*/ \
"spSeqId integer," /*spSeqId 序列号Id*/ \
"condition integer," /*通话状态*/ \
"vm varchar(20)," /*虚拟号码*/ \
"fm varchar(20)," /*电话来源号码*/ \
"tm varchar(20)," /*接听号码*/ \
"callStart timestamp," /*通话开始时间*/ \
"callAnswer timestamp," /*通话接听时间*/ \
"callEnd timestamp," /*通话结束时间*/ \
"callMinutes timestamp," /*通话的秒数*/ \
"missCount integer," /*这个用户miss的电话*/\
"type integer)" /*通话的类别 呼出 or 接听*/

#endif
