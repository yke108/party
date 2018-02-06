/* checkbox样式组件 */
Vue.component('chcekboxbtn',{
  template:"#chcekboxbtn",
  props:['opt'],
  data: function(){
      return {
        val:this.opt.istop?this.opt.istop:'1'
      }
  },
  methods:{
    switchHot: function(val){
        var id = this.opt.id;
        var part = this.opt.part;
        var index = this.opt.index;
        var ct = this.opt.ct;
        var row = this.row;
        this.$emit('success',{id:id,part:part,index:index,ct:ct,value:val});
      }
  }
});
/* 党员动态预览图片 */
Vue.component('previewimg',{
  template:"#previewimg",
  props:['imgurl','imgarr','index'],
  methods:{
    preview: function(){
        this.$emit('success',{index:this.index,imgs:JSON.parse(this.imgarr)});
      }
  }
});
/* 全部推荐数据表格 */
Vue.component('tableplus',{
  template:"#tableplus",
  props:['opt'],
  methods:{
    preview: function(){
        this.$emit('success',{index:this.index,imgs:JSON.parse(this.imgarr)});
      }
  }
});