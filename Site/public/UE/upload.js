// $(document).ready(function(){
		for(var i=1;i<=10;i++)
		{
	        if($('#editor'+i).length > 0)
			{
			    //富文本编辑器的实例化
		        UE.getEditor('editor'+i);
			}
		}
		
		if($('#uploadeditor').length > 0)
		{
		    var imgwrap = '';
		    var sqltype = '';
		    var more ='';
	        //独立上传图片的实例化
	        ue2 = UE.getEditor('uploadeditor');


	        ue2.ready(function () {
		        //设置编辑器不可用
		       // ue2.setDisabled();
		        //隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
		        ue2.hide();
		        //侦听图片上传
		        ue2.addListener('beforeinsertimage', function (t, arg) {
		        	// console.log(arg);
		        	//判断是否是封面图
		        	if(more==1)
		        	{
		        		//修改内容 只能上传一张
		        		// imgwrap.html('<div class="box"><img src=/upload'+ arg[0].src +' width="100" height="100" style="margin-right:20px;margin-top:20px"><input type="hidden" name="'+ sqltype +'" value="'+ arg[0].src +'"><div class="del" onclick="delimg(this)">x</div></div>')
		        		imgwrap.html('<div class="box"><img src='+ arg[0].src +' width="100" height="100" style="margin-right:20px;margin-top:20px"><input type="hidden" name="'+ sqltype +'" value="'+ arg[0].src +'"><div class="del" onclick="delimg(this)">x</div></div>')
		        	}else{
		        		//循环追加图片
						$(arg).each(function(index,element){
						    // imgwrap.append('<div class="box"><img src=/upload' + element.src +' width="100" height="100" style="margin-right:20px;margin-top:20px"><input type="hidden" name="'+ sqltype +'[]" value="'+ element.src +'"><div class="del" onclick="delimg(this)">x</div></div>')
						    imgwrap.append('<div class="box"><img src=' + element.src +' width="100" height="100" style="margin-right:20px;margin-top:20px"><input type="hidden" name="'+ sqltype +'[]" value="'+ element.src +'"><div class="del" onclick="delimg(this)">x</div></div>')
						});

					}
		        })
		    });

		     //弹出图片上传对话框
	        $(".uploadimg").click(function(){
	        	imgwrap = $(this).closest('.form-group').find('.upfiles')
	        	sqltype = $(this).attr('sqltype');
	        	more = $(this).attr('more');
	          	var  myImage = ue2.getDialog("insertimage");
	               myImage.open();
	        });

		}

// });

function delimg(obj)
{
	$(obj).parents('.box').remove();
}
