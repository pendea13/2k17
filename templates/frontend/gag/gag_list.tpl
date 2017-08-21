<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
    var siteUrl='{SITE_URL}';
    function like(id, type)
    {
        var likes=$('span#likes_'+id+"_"+type).attr("no");
        $.ajax({
            url: siteUrl + "/gag/like",
            type: "POST",
            dataType: "Json",
            data : {id: id,type: type},
            success:function(response){
                var id = response['id'];
                var postId = response['postId'];
                var likes =response['likes'];
                if (response==false){
                    window.location='{SITE_URL}/user/login/';
                }else {
                    if (id == 1) {
                        $("#like_"+postId+"_"+type).css('color','red');
                        $("span#likes_"+postId+"_"+type).text('[ '+likes+' ]');
                    } else if(id == 0) {
                        $("#like_"+postId+"_"+type).css('color','initial');
                        $("span#likes_"+postId+"_"+type).text('[ '+likes+' ]');
                    } else {
                        $("#dislike_"+postId+"_"+type).css('color','initial');
                        $("#like_"+postId+"_"+type).css('color','initial');
                        $("span#likes_"+postId+"_"+type).text('[ '+likes+' ]');
                    }
                }
            }
        });
    }
    function dislike(id , type)
    {
        var likes=$('span#likes_'+id+"_"+ type).attr("no");
        $.ajax({
            url: siteUrl + "/gag/dislike",
            type: "POST",
            dataType: "Json",
            data : {id: id,type: type},
            success:function(response){
                var id = response['id'];
                var postId= response['postId'];
                var likes =response['likes'];
                if (response==false){
                    window.location='{SITE_URL}/user/login/';
                }else {
                    if (id == -1) {
                        $("#dislike_"+postId+"_"+type).css('color','red');
                        $("span#likes_"+postId+"_"+type).text('[ '+likes+' ]');
                    } else if(id == 0) {
                        $("#dislike_"+postId+"_"+type).css('color','initial');
                        $("span#likes_"+postId+"_"+type).text('[ '+likes+' ]');
                    } else {
                        $("#dislike_"+postId+"_"+type).css('color','initial');
                        $("#like_"+postId+"_"+type).css('color','initial');
                        $("span#likes_"+postId+"_"+type).text('[ '+likes+' ]');
                    }
                }
            }
        });
    }
</script>
<!-- BEGIN gag_list -->
        <div class="box-shadow">
          <div class="box_header">
            Gag
          </div>
          <table class="medium_table security_check">
            <tr>
              <td>
              <a href="{SITE_URL}/gag/show/id/{GAG_ID}"><h1>{GAG_TITLE}</h1></a></td>
            </tr>
            <tr>
              <td class="rightalign"><a href="{SITE_URL}/gag/show/id/{GAG_ID}"><img src="{GAG_URLIMAGE}" width="420"></a></td>
            </tr>
            <tr>
              <td class="rightalign">
                </div>
                  <span id ="likes_{GAG_ID}_post" no ='{GAG_LIKES}'>[ {GAG_LIKES} ]</span>
                  <button style="{USER_LIKED}" onclick='like({GAG_ID} , "post");' id="like_{GAG_ID}_post">⇧</button>
                  <button style="{USER_DISLIKE}" onclick='dislike({GAG_ID} ,"post");' id="dislike_{GAG_ID}_post">⇩</button>
                  <hr>
                  </table>
        </div>
        <!-- END gag_list -->