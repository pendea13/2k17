
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $(".edit").click(function(){
        var editid = $(this).attr("id");
        $(this).prevAll('.content').contents().unwrap().wrap('<form method="POST" action=""><textarea name="comment"/><button name="id" value="'+editid+'" type="submit">Save</button></form>');
        $(this).hide();
    });

 	$("button.reply").click(function () {
		var replying = $(this).attr("id");
        $(this).replaceWith('<form  method="post" action=""><input type="hidden" name="parent_id" value="'+replying+'"><label for="comment">Comment:</label><textarea name="comment"></textarea><button type="submit">Reply</button></form>');
    	});
  

});
var siteUrl='{SITE_URL}';
  function like(id)
  {
    var likes="{GAG_LIKES}";
    $.ajax({
        url: siteUrl + "/gag/like",
        type: "POST",
        dataType: "Json",
        data : {id: id,likes: likes},
        success:function(response){
          var id = response['id'];
          if (response==false){
          window.location='{SITE_URL}/user/login/';
          }else {
          if (id == 1) {
            $("#like").text('unlike');
            $("#likes").text('[ '+response['likes']+' ]');
          } else if(id == 0) {
            $("#like").text('like');
            $("#likes").text('[ '+response['likes']+' ]');
          } else {
              $("#dislike").text('dislike');
              $("#like").text('like');
              $("#likes").text('[ '+response['likes']+' ]');
          }
        }
      }
    });
  }
function dislike(id)
{
  var likes="{GAG_LIKES}";

    $.ajax({
        url: siteUrl + "/gag/dislike",
        type: "POST",
        dataType: "Json",
        data : {id: id,likes: likes},
        success:function(response){
            var id = response['id'];
            if (response==false){
          window.location='{SITE_URL}/user/login/';
          }else {
            if (id == -1) {
                $("#dislike").text('like');
                $("#likes").text('[ '+response['likes']+' ]');
            } else if(id == 0) {
                $("#dislike").text('dislike');
                $("#likes").text('[ '+response['likes']+' ]');
            } else {
                $("#dislike").text('dislike');
                $("#like").text('like');
                $("#likes").text('[ '+response['likes']+' ]');
            }
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
                <span id ="likes">[ {GAG_LIKES} ]</span>
                <button onclick='like({GAG_ID});' id="like">Like</button>
                <button onclick='dislike({GAG_ID});' id="dislike">Dislike</button>
                  <hr>
                  <form method="post" action="">
                    <input type="hidden" name="parent_id" value="0">
                    <label for="comment">Comment:</label>
                    <textarea name="comment"></textarea>
                    <button type="submit" class="btn btn-primary">Submit</button>
                  </form>
                  <hr>
                </div>
              </td>
            </tr>
<!-- BEGIN comment_list -->
            <tr>
    
              <td><h3> Posted on {COMMENT_DATE} by {COMMENT_USERNAME}</h3></td>

            </tr>
            <tr>
                
              <td>
                  <p class="content" no={COMMENT_ID}>{COMMENT_CONTENT}</p>
                  <!-- BEGIN comment_list_buttones -->
                <button id="{COMMENT_ID}" class="edit rightalign">Edit</button>
                <button onclick="window.location='{SITE_URL}/gag/delete-comment/id/{COMMENT_ID}';" title="Delete" class="delete_state rightalign">Delete</button>
                <!-- END comment_list_buttones -->
                <button id="{COMMENT_ID}" class="reply btn btn-primary">Reply</button>
                  <p>Replys :</p>
                  <hr>
              </td>
            </tr>
        
    <!-- BEGIN comment_reply -->
    <tr>
      <td>
       ↪️Reply posted on {REPLY_DATE} by {REPLY_USERNAME}
      </td>
    </tr>
    <tr>
      <td>
      <p class="content" no={REPLY_ID}>{REPLY_CONTENT}</p>
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

 
