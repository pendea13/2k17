<!-- Bootstrap core CSS -->
<link href="{SITE_URL}/externals/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
</script>
<div class="jumbotron">
<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <h1>{GAG_TITLE}</h1>
    </div>
</div>
<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <img src="{GAG_URLIMAGE}" width="420">
    </div>
</div>

<div class="media">
<!-- BEGIN comment_list -->
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"> Posted on {COMMENT_DATE} by {COMMENT_USERNAME}</h3>
  </div>
  <div class="panel-body">
   <p class="content" no={COMMENT_ID}>{COMMENT_CONTENT}</p>
   
    <button id="{COMMENT_ID}" class="edit btn btn-default">Edit</button>
     <p>Replys :</p>
    <!-- BEGIN comment_reply -->
        <div class="panel panel-default">
			<div class="panel-heading"> Posted on {REPLY_DATE} by {REPLY_USERNAME}</div>
			<div class="panel-body">
      <p class="content" no={REPLY_ID}>{REPLY_CONTENT}</p>
      <button id="{REPLY_ID}" class="edit btn btn-default">Edit</button>
      </div>
		</div>
     <!-- END comment_reply -->
	<button id="{COMMENT_ID}" class="reply btn btn-primary">Reply</button>
  </div>
</div>
 

<!-- END comment_list -->
</div>
<hr>
<form method="post" action="">
<input type="hidden" name="parent_id" value="0">
<label for="comment">Comment:</label>
<textarea name="comment"></textarea>
<button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>