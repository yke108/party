

del = function (url,obj='')
{
    layer.confirm('是否确定删除', function(index){
        send(url,obj);

        layer.close(index);
    })
}

	
send = function (url,obj='')
{
     $.ajax({
        url: url,
        type: 'post',
        success:function(data){
            if(data.status==1)
            {
                if(url.indexOf('mien_change',url) > 0){
                	layer.msg(data['info'],{'icon':6,'time':'2000'});
                    if(data.Code==1)
                    {
                        $(obj).removeClass('btn-danger').addClass('btn-success');
                        (url.indexOf('status',url) > 0) ? $(obj).html('已通过') : $(obj).html('是');
                    }else{
                        $(obj).removeClass('btn-success').addClass('btn-danger');
                        (url.indexOf('status',url) > 0) ? $(obj).html('未通过') : $(obj).html('否');
                    }
                }else if(url.indexOf('del',url) > 0) {
                    layer.msg(data['info'], {'icon': 6, 'time': '1000'});
                    $(obj).parent().parent().remove();
                    window.location.reload();
                }else if(url.indexOf('recovery_change',url) > 0){
                    layer.msg(data['info'],{'icon':6,'time':'1000'});
                    $(obj).parent().parent().remove();
                    window.location.reload();
                }else{
                	layer.msg(data['info'],{'icon':6,'time':'1000'},function(){
                		window.location.reload();
                	});
                }
            }else{
                layer.msg(data['info'],{'icon':5});
            }
        }
    })
}

recovery_change = function (url,obj='') {
    layer.confirm('是否确定恢复该条数据', function (index) {
        send(url, obj);

        layer.close(index);
    })
}


/*123*/