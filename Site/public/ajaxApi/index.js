function trandata (data) {
  var def = $.Deferred();
  var res = data;
  if(typeof data !== 'object'){
    res = JSON.parse(data);
  }
  if (!Number(res.Error)) {
    return def.resolve(res);
  } else {
    return def.reject();
  }
};
//主页
var indexList = function(req){return $.post("/index/list",req?req:{}).then(function(res){return trandata(res)})};

//分类列表
var categoryCategory = function(req){return $.post("/category/category",req?req:{}).then(function(res){return trandata(res)})};
//分类添加/编辑
var categoryCreate_or_modify = function(req){return $.post("/category/create_or_modify",req?req:{}).then(function(res){return trandata(res)})};
//分类删除
var categoryDel = function(req){return $.post("/category/del",req?req:{}).then(function(res){return trandata(res)})};
//分类状态开关
var categorySwitchStatus = function(req){return $.post("/category/switchStatus",req?req:{}).then(function(res){return trandata(res)})};
//文章列表
var articleIndex = function(req){return $.post("/article/index",req?req:{}).then(function(res){return trandata(res)})};
//文章删除
var articleDel = function(req){return $.post("/article/del",req?req:{}).then(function(res){return trandata(res)})};
//文章添加/编辑
var article_create_or_modify = function(req){return $.post("/article/create_or_modify",req?req:{}).then(function(res){return trandata(res)})};
//文章推荐开关
var articleSwitchHot = function(req){return $.post("/article/switchHot",req?req:{}).then(function(res){return trandata(res)})};
//文章状态开关
var articleSwitchStatus = function(req){return $.post("/article/switchStatus",req?req:{}).then(function(res){return trandata(res)})};
//文章分类
var articleCategory = function(req){return $.post("/article/category",req?req:{}).then(function(res){return trandata(res)})};
//文章官方
var articleWh = function(req){return $.post("/article/wh",req?req:{}).then(function(res){return trandata(res)})};


//党建专题-分类列表
//var categorySpecial = function(req){return $.post("/category/special",req?req:{}).then(function(res){return trandata(res)})};
//党建专题-分类删除
//var categoryDel = function(req){return $.post("/category/del",req?req:{}).then(function(res){return trandata(res)})};
//党建专题-分类列表
var categorySpecial = function(req){return $.post("/category/special",req?req:{}).then(function(res){return trandata(res)})};
//党建专题-分类添加/编辑
var categoryCreate_or_modify_special = function(req){return $.post("/category/create_or_modify_special",req?req:{}).then(function(res){return trandata(res)})};

//党建专题-文章官方列表
var specialWh = function(req){return $.post("/special/wh",req?req:{}).then(function(res){return trandata(res)})};
//党建专题-文章删除
var specialDel = function(req){return $.post("/special/del",req?req:{}).then(function(res){return trandata(res)})};
//党建专题-文章推荐开关
var specialSwitchHot = function(req){return $.post("/special/switchHot",req?req:{}).then(function(res){return trandata(res)})};
//党建专题-文章添加/编辑
var special_create_or_modify = function(req){return $.post("/special/create_or_modify",req?req:{}).then(function(res){return trandata(res)})};
//党建专题-文章状态开关
var specialSwitchStatus = function(req){return $.post("/special/switchStatus",req?req:{}).then(function(res){return trandata(res)})};
//党建专题-自定义文章列表
var specialIndex = function(req){return $.post("/special/index",req?req:{}).then(function(res){return trandata(res)})};
//党建专题-分类选择
var specialCategory = function(req){return $.post("/special/category",req?req:{}).then(function(res){return trandata(res)})};




//积分-规则列表
var pointRuleList = function(req){return $.post("/point/ruleList",req?req:{}).then(function(res){return trandata(res)})};
var pointEditRule = function(req){return $.post("/point/editRule",req?req:{}).then(function(res){return trandata(res)})};
var pointLogList = function(req){return $.post("/point/logList",req?req:{}).then(function(res){return trandata(res)})};


//管理员
var adminList = function(req){return $.post("/admin/index",req?req:{}).then(function(res){return trandata(res)})};
var adminEdit = function(req){return $.post("/admin/createOrModify",req?req:{}).then(function(res){return trandata(res)})};
var adminDel = function(req){return $.post("/admin/del",req?req:{}).then(function(res){return trandata(res)})};
var adminLogList = function(req){return $.post("/admin/logList",req?req:{}).then(function(res){return trandata(res)})};


//用户管理
var userIndex = function(req){return $.post("/user/index",req?req:{}).then(function(res){return trandata(res)})};

//活动管理-列表
var even_even_list = function(req){return $.post("/even/even_list",req?req:{}).then(function(res){return trandata(res)})};
//活动删除
var Even_even_del = function(req){return $.post("/even/even_del",req?req:{}).then(function(res){return trandata(res)})};
//活动报名人数列表
var even_even_user = function(req){return $.post("/even/even_user",req?req:{}).then(function(res){return trandata(res)})};
//活动修改
var even_even_save = function(req){return $.post("/even/even_save",req?req:{}).then(function(res){return trandata(res)})};
//活动状态修改
var even_even_change = function(req){return $.post("/even/even_change",req?req:{}).then(function(res){return trandata(res)})};



//公告-列表
var Notice_notice_list = function(req){return $.post("/notice/notice_list",req?req:{}).then(function(res){return trandata(res)})};
//公告-修改状态
var notice_notice_change = function(req){return $.post("/notice/notice_change",req?req:{}).then(function(res){return trandata(res)})};
//公告-修改-新增
var notice_notice_save = function(req){return $.post("/notice/notice_save",req?req:{}).then(function(res){return trandata(res)})};
//公告-删除
var notice_notice_del = function(req){return $.post("/notice/notice_del",req?req:{}).then(function(res){return trandata(res)})};



//广告-列表
var ad_ad_list = function(req){return $.post("/ad/ad_list",req?req:{}).then(function(res){return trandata(res)})};
//广告-推荐
var ad_ad_change = function(req){return $.post("/ad/ad_change",req?req:{}).then(function(res){return trandata(res)})};
//广告-类型
var ad_ad_type = function(req){return $.post("/ad/location",req?req:{}).then(function(res){return trandata(res)})};
//广告-类型
var ad_ad_save = function(req){return $.post("/ad/ad_save",req?req:{}).then(function(res){return trandata(res)})};

//风采列表
var mien_mien_list = function(req){return $.post("/mien/mien_list",req?req:{}).then(function(res){return trandata(res)})};
//推荐风采
var mien_mien_change = function(req){return $.post("/mien/mien_change",req?req:{}).then(function(res){return trandata(res)})};

//小程序获取授权登录链接
var xcx_getAuthorizeUrl = function(req){return $.post("/xcx/getAuthorizeUrl",req?req:{}).then(function(res){return trandata(res)})};
//小程序发布代码
var xcx_commitCode = function(req){return $.post("/xcx/commitCode",req?req:{}).then(function(res){return trandata(res)})};
//小程序二维码
var xcx_getQrcode = function(req){return $.post("/xcx/getQrcode",req?req:{}).then(function(res){return trandata(res)})};
//小程序模板
var xcx_getTemplateList = function(req){return $.post("/xcx/getTemplateList",req?req:{}).then(function(res){return trandata(res)})};
//小程序停止发布
var xcx_pause = function(req){return $.post("/xcx/pause",req?req:{}).then(function(res){return trandata(res)})};

// 移动学堂
// 分类管理
var categoryStudy = function(req){return $.post("/category/study",req?req:{}).then(function(res){return trandata(res)})};
var categoryEditStudy = function(req){return $.post("/category/editStudy",req?req:{}).then(function(res){return trandata(res)})};

//视频列表
var videoIndex = function(req){return $.post("/video/video_list",req?req:{}).then(function(res){return trandata(res)})};
//视频删除
var videoDel = function(req){return $.post("/video/del",req?req:{}).then(function(res){return trandata(res)})};
//视频添加/编辑
var video_create_or_modify = function(req){return $.post("/video/create_or_modify",req?req:{}).then(function(res){return trandata(res)})};
//视频状态开关
var videoSwitchStatus = function(req){return $.post("/video/switchStatus",req?req:{}).then(function(res){return trandata(res)})};
//视频分类
var videoCategory = function(req){return $.post("/video/category",req?req:{}).then(function(res){return trandata(res)})};
//视频官方
var videoWh = function(req){return $.post("/video/wh",req?req:{}).then(function(res){return trandata(res)})};
//视频-分类添加/编辑
var category_or_modify_video = function(req){return $.post("/category/create_or_modify_video",req?req:{}).then(function(res){return trandata(res)})};


//小程序列表
var wxIndex = function(req){return $.post("/Wx/wxsoft",req?req:{}).then(function(res){return trandata(res)})};
//小程序添加/编辑
var wx_create_or_modify = function(req){return $.post("/Wx/create_or_modify",req?req:{}).then(function(res){return trandata(res)})};
//地区联动
var wx_region = function(req){return $.post("/Wx/region",req?req:{}).then(function(res){return trandata(res)})};


//支部组列表
var groupIndex = function(req){return $.post("/Group/group",req?req:{}).then(function(res){return trandata(res)})};
//支部组添加/编辑
var group_create_or_modify = function(req){return $.post("/Group/create_or_modify",req?req:{}).then(function(res){return trandata(res)})};

//党员管理-添加
var user_create = function(req){return $.post("/user/create",req?req:{}).then(function(res){return trandata(res)})};
//党员管理-状态修改
var user_switch_status = function(req){return $.post("/user/switch_status",req?req:{}).then(function(res){return trandata(res)})};
//党员管理-可选项目
var user_options = function(req){return $.post("/user/options",req?req:{}).then(function(res){return trandata(res)})};

//音频列表
var audioIndex = function(req){return $.post("/audio/audio_list",req?req:{}).then(function(res){return trandata(res)})};
// var audioIndex = function(req){return $.post("/tools/OptionList",req?req:{}).then(function(res){return trandata(res)})};

//音频删除
var audioDel = function(req){return $.post("/audio/del",req?req:{}).then(function(res){return trandata(res)})};
//音频添加/编辑
var audio_create_or_modify = function(req){return $.post("/audio/create_or_modify",req?req:{}).then(function(res){return trandata(res)})};
//音频状态开关
var audioSwitchStatus = function(req){return $.post("/audio/switchStatus",req?req:{}).then(function(res){return trandata(res)})};
//音频分类
var audioCategory = function(req){return $.post("/audio/category",req?req:{}).then(function(res){return trandata(res)})};
//音频官方
var audioWh = function(req){return $.post("/audio/wh",req?req:{}).then(function(res){return trandata(res)})};

//读书列表
var readIndex = function(req){return $.post("/read/read_list",req?req:{}).then(function(res){return trandata(res)})};
//读书删除
var readDel = function(req){return $.post("/read/del",req?req:{}).then(function(res){return trandata(res)})};
//读书添加/编辑
var read_create_or_modify = function(req){return $.post("/read/create_or_modify",req?req:{}).then(function(res){return trandata(res)})};
//读书状态开关
var readSwitchStatus = function(req){return $.post("/read/switchStatus",req?req:{}).then(function(res){return trandata(res)})};
//读书分类
var readCategory = function(req){return $.post("/read/category",req?req:{}).then(function(res){return trandata(res)})};
//读书官方
var readWh = function(req){return $.post("/read/wh",req?req:{}).then(function(res){return trandata(res)})};


//相册列表
var  photoIndex = function(req){return $.post("/photo/photo_list",req?req:{}).then(function(res){return trandata(res)})};
//相册删除
var  photoDel = function(req){return $.post("/photo/del",req?req:{}).then(function(res){return trandata(res)})};
//相册添加/编辑
var  photo_create_or_modify = function(req){return $.post("/photo/create_or_modify",req?req:{}).then(function(res){return trandata(res)})};
//相册状态开关
var  photoSwitchStatus = function(req){return $.post("/photo/switchStatus",req?req:{}).then(function(res){return trandata(res)})};
//相册分类
var  photoCategory = function(req){return $.post("/photo/category",req?req:{}).then(function(res){return trandata(res)})};
//相册官方
var  photoWh = function(req){return $.post("/photo/wh",req?req:{}).then(function(res){return trandata(res)})};


//移动学堂-阅读管理-官方列表
var ebook_wh = function(req){return $.post("/ebook/wh",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-阅读管理-自定义列表
var ebook_ebook_list = function(req){return $.post("/ebook/ebook_list",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-阅读管理-分类列表
var ebook_category = function(req){return $.post("/ebook/category",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-阅读管理-状态切换
var ebook_switchStatus = function(req){return $.post("/ebook/switchStatus",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-阅读管理-删除书籍
var ebook_del = function(req){return $.post("/ebook/del",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-阅读管理-删除章节
var ebook_del_node = function(req){return $.post("/ebook/del_node",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-阅读管理-添加章节
var ebook_add_node = function(req){return $.post("/ebook/add_node",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-阅读管理-章节树状结构
var ebook_tree_node = function(req){return $.post("/ebook/tree_node",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-阅读管理-章节详情
var ebook_node_info = function(req){return $.post("/ebook/node_info",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-阅读管理-编辑或修改电子书
var ebook_create_or_modify = function(req){return $.post("/ebook/create_or_modify",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-阅读管理-编辑章节
var ebook_edit_node = function(req){return $.post("/ebook/edit_node",req?req:{}).then(function(res){return trandata(res)})};

//移动学堂-评测管理-添加或修改评测
var question_create_or_modify = function(req){return $.post("/question/create_or_modify",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-评测管理-分类列表
var question_category = function(req){return $.post("/question/category",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-评测管理-删除评测
var question_del = function(req){return $.post("/question/del",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-评测管理-删除试题
var question_del_item = function(req){return $.post("/question/del_item",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-评测管理-官方列表
var question_wh = function(req){return $.post("/question/wh",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-评测管理-添加或修改试题
var question_create_or_modify_item = function(req){return $.post("/question/create_or_modify_item",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-评测管理-状态开关
var question_switchStatus = function(req){return $.post("/question/switchStatus",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-评测管理-评测列表
var question_question_list = function(req){return $.post("/question/question_list",req?req:{}).then(function(res){return trandata(res)})};
//移动学堂-评测管理-题目列表
var question_item_list = function(req){return $.post("/question/item_list",req?req:{}).then(function(res){return trandata(res)})};

//任务管理-新增任务
var tools_optionadd = function(req){return $.post("/tools/optionadd",req?req:{}).then(function(res){return trandata(res)})};
//任务管理-任务列表
var tools_optionlist = function(req){return $.post("/tools/optionlist",req?req:{}).then(function(res){return trandata(res)})};
//任务管理-删除任务
var tools_optionadd = function(req){return $.post("/tools/optionadd",req?req:{}).then(function(res){return trandata(res)})};

