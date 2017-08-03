<h1>{ARTICLE_ID}</h1>
<p>{ARTICLE_CONTENT}</p>
<p><a href="{SITE_URL}/article/list">Go Back</a></p>
<!-- BEGIN comment_form -->
<form method="post" action="">
<label for="comment">Comment:</label>
<textarea name="comment"></textarea>
<input type="hidden" name="url" value="<?php echo htmlentities($_SERVER['REQUEST_URI'])?>" />
<input type="submit" />
</form>
<!-- END comment_form -->