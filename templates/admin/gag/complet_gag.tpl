<link href="{SITE_URL}/externals/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<h1>{GAG_TITLE}</h1>
<img src="{GAG_URLIMAGE}" width="420">

<div class="media">
<!-- BEGIN comment_list -->
  <img class="d-flex mr-3" src="..." alt="Generic placeholder image">
  	<div class="media-body">
    	<h5 class="mt-0">{COMMENT_DATE} {COMMENT_IDUSER}</h5>
      	<p>{COMMENT_CONTENT}</p>

<!-- BEGIN replay_list -->
    	<div class="media mt-3">
      		<a class="d-flex pr-3" href="#">
        	<img src="..." alt="Generic placeholder image">
      		</a>
      		<div class="media-body">
        		<h5 class="mt-0">{COMMENT_DATE} {COMMENT_IDUSER}</h5>
      			<p>{COMMENT_CONTENT}</p>
      		</div>
    	</div>
   
<!-- END replay_list -->

  	</div>
<form method="post" action="">
<input type="hidden" name="parent_id" value="{COMMENT_ID}">
<label for="comment">Comment:</label>
<textarea name="comment"></textarea>
<input type="hidden" name="url" value="<?php echo htmlentities($_SERVER['REQUEST_URI'])?>" />
<input type="submit" />
</form>
<!-- END comment_list -->
</div>
<hr>
<form method="post" action="">
<input type="hidden" name="parent_id" value="0">
<label for="comment">Comment:</label>
<textarea name="comment"></textarea>
<input type="hidden" name="url" value="<?php echo htmlentities($_SERVER['REQUEST_URI'])?>" />
<input type="submit" />
</form>