//var $domain = "http://party.huiyi.t.weixinren.cn/admin/api.php"
//var $domain = "http://huiyi.com/admin/api.php"
var $domain = "/admin/api.php"
$.ajaxSetup({
  timeout: 10000,
  cache: false,
  traditional: true,
})
$(document).ajaxSend(function(e, xhr, opt) {
  if(opt.url.indexOf('logout')>-1){
    return
  }
  var indexLayer;
  if(opt.data.indexOf('closeloading')<0){
    indexLayer = layer.load(2, {
      shade: [0.1, '#000000'] //0.1透明度的白色背景
    })
  }

  sessionStorage.setItem('layerLoadingIndex', indexLayer)
  if(typeof(opt.data) !== "string") return
  opt.success = 'text'
  opt.url = $domain + opt.url
});
$(document).ajaxSuccess(function(e, xhr, opt) {
  var data = JSON.parse(xhr.responseText);
  switch(Number(data.Error)) {
    case 0:
      console.log('ok')
      break
    default:
      layer.msg(data.Message);
      layer.close(sessionStorage.getItem('layerLoadingIndex'))
  }
});
$(document).ajaxError(function(e, xhr, opt) {
  layer.msg('连接失败！');
});
$(document).ajaxComplete(function(e, xhr, opt) {
  layer.close(sessionStorage.getItem('layerLoadingIndex'))
})

// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
Date.prototype.format = function(format) {
  var o = {
    "M+": this.getMonth() + 1, //month
    "d+": this.getDate(), //day
    "h+": this.getHours(), //hour
    "m+": this.getMinutes(), //minute
    "s+": this.getSeconds(), //second
    "q+": Math.floor((this.getMonth() + 3) / 3), //quarter
    "S": this.getMilliseconds() //millisecond
  }
  if(/(y+)/.test(format)) format = format.replace(RegExp.$1,
    (this.getFullYear() + "").substr(4 - RegExp.$1.length));
  for(var k in o)
    if(new RegExp("(" + k + ")").test(format))
      format = format.replace(RegExp.$1,
        RegExp.$1.length == 1 ? o[k] :
        ("00" + o[k]).substr(("" + o[k]).length));
  return format;
}

var upload_public = function(callback) { //单个图片上传
  var $body = $('body');
  $("#uploadPicker").remove();
  var $pick = document.createElement('div');
  $pick.setAttribute("id", "uploadPicker");
  $pick.style.display = 'none'
  $body.append($pick);
  var uploader = WebUploader.create({
    auto: true,
    // 文件接收服务端。
    server: '/index.php/ue/index',
    // 选择文件的按钮。可选。
    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
    pick: {
    	id: '#uploadPicker',
    	multiple: false
    },
    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
    resize: false
  });
  var stI = setInterval(function() { //手动触发上传按钮
    if(uploader.state === "ready") {
      $("#uploadPicker .webuploader-element-invisible").trigger('click')
      clearInterval(stI)
    }
  }, 100);
  uploader.on("uploadSuccess", function(file, res) {
    if(!res.state||res.state != "SUCCESS") {
      layer.msg("上传失败");
      return
    }
    layer.msg('上传成功');
    callback && callback(res, file)
  })
  //console.log(WebUploader.version)
  //$(document).find(".webuploader-element-invisible").trigger('click')
}
/*获取URL后面参数*/
function getUrlQuery(name){
  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
  var r = window.location.search.substr(1).match(reg);
  if (r != null) return unescape(r[2]);
  return null;
}

var upload_radio = function(callback) { //单个音频上传
    var $body = $('body');
    $("#audioPicker").remove();
    var $pick = document.createElement('div');
    $pick.setAttribute("id", "audioPicker");
    $pick.style.display = 'none'
    $body.append($pick);
    var uploader = WebUploader.create({
        auto: true,
        // 文件接收服务端。
        server: '/index.php/ue/index',
        formData:{
            'uptype':'audio',
        },
        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: {
            id: '#audioPicker',
            multiple: true
        },
        // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
        resize: false
    });
    var stI = setInterval(function() { //手动触发上传按钮
        if(uploader.state === "ready") {
            $("#audioPicker .webuploader-element-invisible").trigger('click')
            clearInterval(stI)
        }
    }, 100);
    uploader.on("uploadSuccess", function(file, res) {
        console.log(res);
        if(!res.state||res.state != "SUCCESS") {
            layer.msg("上传失败");
            return
        }
        layer.msg('上传成功');
        callback && callback(res, file)
    })
    //console.log(WebUploader.version)
    //$(document).find(".webuploader-element-invisible").trigger('click')
}
/*获取URL后面参数*/
function getUrlQuery(name){
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
}



$(document).on('change',"#files", function (event) {
    var _this = this;
    if(this.files.length > 1)
    {
        layer.msg('选择的视频不能大于1个');
        return;
    }
    $.post("/Ue/createUploadVideo", {}, function(data) {
        if (data.error == 0) {
            uploadAuth = data.info.UploadAuth;
            uploadAddress = data.info.UploadAddress;
            videoId = data.info.VideoId;

            var userData = '{"Vod":{"UserData":"{"IsShowWaterMark":"false","Priority":"7"}"}}';
            uploadervideo.addFile(_this.files[0], null, null, null, userData);
            uploadervideo.startUpload();
        }
    },'json');
});
var video_public = function(callback) { //单个视频上传
    var $body = $('body');
    $("#files").remove();
    var $pick = document.createElement('input');
    $pick.setAttribute("id", "files");
    $pick.setAttribute("type", "file");
    $pick.setAttribute("name", "file");
    $pick.style.display = 'none';
    $body.append($pick);
    $("#files").trigger('click');
    callbackvideo = callback;

  //console.log(WebUploader.version)
  //$(document).find(".webuploader-element-invisible").trigger('click')
};
/**
 * Vue\layedate注册时间插件自定义命令
 * */
Vue.directive('laydate',{
  bind:function(el,binding){
    var sendata = binding.value.sendData
    layui.use('laydate', function(){
      var laydate = layui.laydate;
      //执行一个laydate实例
      laydate.render({
        elem: el //指定元素
        ,value:sendata.study_time
        ,done: function(value, date, endDate){
          sendata.study_time = value
        }
      });
    });
  }
})
/* 注册表格组件
  模板：<seexcx/>
  基本数据：{
    col:[{key:'name',text:'小程序名称'},{key:'erea',text:'地区'},{title:"",format:_thisf.formatBtn}],//列
    data:[{name:"广东党建",erea:'广东'},{name:"重庆党建",erea:'重庆'}],//行
    shaiXuan:{page:1,pagesize:10},//筛选
    count:20//总数
  }
  */
Vue.component('mytable',{
    template:"#seexcxtem",
    props:['tb','getdatafunc'],
    beforeCreate: function(){
      var __this = this
      /* 自定义指令:加载自定义td的html并挂载 */
      function createDom(el, binding,change){
        el.innerHTML = '';
        var pz = binding.value
        var format = pz.a(el,pz.b,__this);
          // 创建构造器
        var Profile = Vue.extend({
          template: format.html,
          data: function(){
            return $.extend({},format.data)
          },
          methods: format.methods
        })
         // 创建 Profile 实例，并挂载到一个元素上。
        var component = new Profile().$mount()
        el.appendChild(component.$el)
      }
      Vue.directive('loadTd', {
        update: function(el, binding){
          createDom(el, binding,true)
        },
        inserted: function (el, binding) {
          createDom(el, binding)
        }
      })
    },
    watch: {
      'tb.data': function(d){
        var __this = this
       if(d){
         this.$nextTick(function(){
          __this.initpage(__this.tb)
         })
       }
      }
    },
    methods:{
      initpage: function(opt){
        /* 生成分页 */
        var _seexcx = this
        if(!opt.data.length)return
        layui.use('laypage', function(){
          var laypage = layui.laypage;
          //执行一个laypage实例
          laypage.render({
            elem: 'pagesaion' //注意，这里的 test1 是 ID，不用加 # 号
            ,layout: ['count', 'prev', 'page', 'next', 'skip']
            ,count: opt.count //数据总数，从服务端得到
            ,limit:opt.shaiXuan.pagesize
            ,curr:opt.shaiXuan.page
            ,jump: function(obj, first){
              if(!first){
                opt.shaiXuan.page = obj.curr;
                _seexcx.$emit('pagechange',opt);
              }
            }
          });
        });
      },
      search: function(){
        this.$emit('pagechange',this.tb);
      },
      tr_click: function(row,index){
        let obj ={row:row,index:index}
        this.$emit('trclick',obj);
      }
    }
  });
/* 上传图片文件webupload实例创建(修复upload无法点击) */
function initImageUpload(el, binding){

//el.innerHTML = ''
  var callback = binding.value.callback
  var formData = binding.value.formdata
  var type = binding.value.type?binding.value.type:''
  var limit = binding.value.limit||20
  var length = binding.value.length
  if(length==limit)return
  var extensions = ''
  switch(type){
    /* 上传文件类型，设置接收文件的后缀名 */
    case '':
    case 'image':
      extensions = 'gif,jpg,jpeg,bmp,png'
    break
  }
  var uploader = WebUploader.create({
    fileNumLimit:limit,
    auto: true,
    // 文件接收服务端。
    server: '/index.php/ue/index',
    formData:formData?formData:{dir_name:'custom'},
    // 选择文件的按钮。可选。
    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
    pick: {id: el},
    accept:{
        extensions: extensions,
      },
    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
    resize: false
  });
uploader.on("uploadSuccess", function(file, res) {
  if(res.error) {
    layer.msg("上传失败");
      return
  }
  layer.msg('上传成功');
  callback && callback(res, file)
})
uploader.on("error", function(type) {
    if(type=='Q_TYPE_DENIED') {
      layer.msg("上传类型错误");
        return
    }
})
}
Vue.directive('uploadimg', { // 上传图片文件
bind:function(el, binding) {
  initImageUpload(el, binding)
},
update:function(el, binding) {
  initImageUpload(el, binding)
}
});

var uploadAuth = "";
var uploadAddress = "";
var videoId = "";
var callbackvideo = $.noop();
var uploadervideo = new AliyunUpload.Vod({
    //分片大小默认1M
    partSize: 1048576,
    //并行上传分片个数，默认5
    parallel: 5,
    //网络原因失败时，重新上传次数，默认为3
    retryCount: 3,
    //网络原因失败时，重新上传间隔时间，默认为2秒
    retryDuration: 2,
    // 开始上传
    'onUploadstarted': function (uploadInfo) {
        uploadervideo.setUploadAuthAndAddress(uploadInfo, uploadAuth, uploadAddress);
    },
    // 文件上传成功
    'onUploadSucceed': function (uploadInfo) {
        $.post("/Ue/getPlayInfo", {video_id:videoId}, function(data) {
            if(data.error == 0){
                callbackvideo(data.PlayURL,videoId)
            }
        },'json');
    },
    // 文件上传失败
    'onUploadFailed': function (uploadInfo, code, message) {
        alert(message);
    },
    // 文件上传进度，单位：字节
    'onUploadProgress': function (uploadInfo, totalSize, loadedPercent) {
        var jdt = Math.ceil(loadedPercent * 100)+'%';
        if(loadedPercent == 1)
        {
            $('#jdt').html('上传成功');
        }else{
            $('#jdt').html(jdt);
        }
        $('#jdt').css('width',jdt);
    },
    // 上传凭证超时
    'onUploadTokenExpired': function () {
        // console.log("onUploadTokenExpired");
        $.post("/Ue/refreshUploadVideo", {video_id: videoId}, function(data) {
            if (data.error == 0) {
                uploadAuth = data.UploadAuth
                uploadervideo.resumeUploadWithAuth(uploadAuth);
            }
        });
    }
});

