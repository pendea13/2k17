
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $(".edit").click(function(){
        var editid = $(this).attr("id");
        $(this).prevAll('.content').contents().unwrap().wrap('<form method="POST" action=""><textarea name="comment"/><button name="id" value="'+editid+'" type="submit">Save</button></form>');
        $(this).hide();
    });
    $(document).on('click', '.reply', function () {
		    var replying = $(this).attr("id");
        $(this).css('display' ,'none');
        $("#form_"+replying).css('display' ,'block');

    	});
  

});
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
function comment(gagId , parent_id='0')
{ var conntent=$('#conntent_'+parent_id).val();
  var com="'com'";
  var deleteUrl="/gag/delete-comment/id/";
  $.ajax({
        url: siteUrl + "/gag/comment",
        type: "POST",
        dataType: "Json",
        data : {parent_id : parent_id ,conntent : conntent, gagId : gagId },
        success:function(response){
            var idComment = response['commentId'];
            var idParent = response['parent_id'];
            var postId= response['postId'];
            var likes = response['likes'];
            var commentDate = response['date'];
            var commentUsername = response['username'];
            var conntent = response['conntent']; 
            if (response==false){
                window.location='{SITE_URL}/user/login/';
            }else if(parent_id=='0') {
                $("#append_"+gagId).prepend('<hr><tr><td> <span id ="likes_'+idComment+'_com" no ="'+likes+'">[ '+likes+' ]</span><button  onclick="like('+idComment+' , '+com+');" id="like_'+idComment+'_com">⇧</button><button  onclick="dislike('+idComment+' ,'+com+');" id="dislike_'+idComment+'_com">⇩</button><h3> Posted on '+commentDate+' by '+commentUsername+'</h3></td></tr><tr><td><p class="content" no="'+idComment+'">'+conntent+'</p><button id="'+idComment+'" class="edit rightalign">Edit</button><button onclick=window.location="'+siteUrl+deleteUrl+idComment+'" title="Delete" class="delete_state rightalign">Delete</button><button id="'+idComment+'" class="reply btn btn-primary">Reply</button><p>Replys :</p><div id="form_'+idComment+'" style="display: none;" ><textarea rows="2" cols="70" id="conntent_'+idComment+'"></textarea><button onclick="comment('+gagId+','+idComment+');">Reply</button><hr></div><div id="append_'+idComment+'"></div></td></tr>');
                $('textarea#conntent_'+idParent).val('');
            } else {
                $("#append_"+parent_id).prepend('<hr><tr><td>↪<span id ="likes_'+idComment+'_com" no ="'+likes+'">[ '+likes+' ]</span><button style="{REPLY_LIKED}" onclick="like('+idComment+' , '+com+');" id="like_'+idComment+'_com">⇧</button><button style="{REPLY_DISLIKE}" onclick="dislike('+idComment+' ,'+com+');" id="dislike_'+idComment+'_com">⇩</button>️Reply posted on '+commentDate+' by '+commentUsername+'</td></tr> <tr><td> <p class="content" no="'+idComment+'">'+conntent+'</p><button id="'+idComment+'" class="edit brightalign">Edit</button> <button onclick=window.location="'+siteUrl+deleteUrl+idComment+'" title="Delete" class="delete_state rightalign">Delete</button> </td> </tr>');
                  $("#form_"+parent_id).css('display' ,'none');
                  $("#"+parent_id+".reply").css('display' ,'inline');
                  $('textarea#conntent_'+idParent).val('');
              }
        }
    });

}
</script>
        <div class="box-shadow">
          <div class="box_header">
            Gag
          </div>
          <table class="medium_table security_check">
            <tr>
              <td><h1>{GAG_TITLE}</h1></td>
            </tr>
            <tr>
              <td class="rightalign"><img src="{GAG_URLIMAGE}" width="420"></td>
            </tr>
            <tr>
              <td class="rightalign">
                </div>
                    <span id ="likes_{GAG_ID}_post" no ='{GAG_LIKES}'>[ {GAG_LIKES} ]</span>
                    <button style="{USER_LIKED}" onclick='like({GAG_ID} , "post");' id="like_{GAG_ID}_post">⇧</button>
                    <button style="{USER_DISLIKE}" onclick='dislike({GAG_ID} ,"post");' id="dislike_{GAG_ID}_post">⇩</button>
                  <div>
                  <hr>
                    <input type="hidden" name="parent_id" value="0">
                    <label for="comment">Comment:</label>
                    <textarea rows="2" cols="70" id="conntent_0"></textarea>
                    <button onclick='comment({GAG_ID});' class="btn btn-primary">Submit</button>
                  </div>
                  <div  id="append_{GAG_ID}">
                    
                  </div>
                  <hr>
                </div>
              </td>
            </tr>
<!-- BEGIN comment_list -->
            <tr>
    
                <td> <span id ="likes_{COMMENT_ID}_com" no ='{COMMENT_LIKES}'>[ {COMMENT_LIKES} ]</span>
                  <button style="{COMMENT_LIKED}" onclick='like({COMMENT_ID} , "com");' id="like_{COMMENT_ID}_com">⇧</button>
                  <button style="{COMMENT_DISLIKE}" onclick='dislike({COMMENT_ID} ,"com");' id="dislike_{COMMENT_ID}_com">⇩</button>
                   <img src="{COMMENT_URLIMAGE}" width="100" height="100"><h3> Posted on {COMMENT_DATE} by {COMMENT_USERNAME}</h3>
                  </td>

            </tr>
            <tr>
                
              <td>
                  <p class="content" no="{COMMENT_ID}">{COMMENT_CONTENT}</p>
                  <!-- BEGIN comment_list_buttones -->
                <button id="{COMMENT_ID}" class="edit rightalign">Edit</button>
                <button onclick="window.location='{SITE_URL}/gag/delete-comment/id/{COMMENT_ID}';" title="Delete" class="delete_state rightalign">Delete</button>
                <!-- END comment_list_buttones -->
                <button id="{COMMENT_ID}" class="reply btn btn-primary">Reply</button>
                  <p>Replys :</p>
                  <div id="form_{COMMENT_ID}" style="display: none;" >
                  <hr>
                  <textarea rows="2" cols="70" id="conntent_{COMMENT_ID}"></textarea>
                  <button onclick='comment({GAG_ID} , {COMMENT_ID});'>Reply</button>
                  </div>
                  <div id="append_{COMMENT_ID}">
                    
                  </div>
                  <hr>
              </td>
            </tr>
        
    <!-- BEGIN comment_reply -->
    <tr>
      <td>
       ↪<span id ="likes_{REPLY_ID}_com" no ='{REPLY_LIKES}'>[ {REPLY_LIKES} ]</span>
          <button style="{REPLY_LIKED}" onclick='like({REPLY_ID} , "com");' id="like_{REPLY_ID}_com">⇧</button>
          <button style="{REPLY_DISLIKE}" onclick='dislike({REPLY_ID} ,"com");' id="dislike_{REPLY_ID}_com">⇩</button>️
          Reply posted on {REPLY_DATE} by {REPLY_USERNAME}
      </td>
    </tr>
    <tr>
      <td>
      <p class="content" no="{REPLY_ID}">{REPLY_CONTENT}</p>
        <!-- BEGIN comment_reply_buttones -->
        <button id="{REPLY_ID}" class="edit brightalign">Edit</button>
        <button onclick="window.location='{SITE_URL}/gag/delete-comment/id/{REPLY_ID}';" title="Delete" class="delete_state rightalign">Delete</button>
        <!-- END comment_reply_buttones -->
        <hr>
      </td>
    </tr>
    <!-- END comment_reply -->
<!-- END comment_list -->
          </table>
        </div>

 
