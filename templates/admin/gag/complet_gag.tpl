<h1>{GAG_TITLE}</h1>
<img src="{GAG_URLIMAGE}" width="420">
<table>
<!-- BEGIN comment_list -->
<tr>
<td>{COMMENT_IDUSER}</td>
<td>{COMMENT_DATE}</td>
</tr>
<tr>
<td>{COMMENT_CONTENT}</td>
<!-- <td><a href="{SITE_URL}/article/show_article_content/id/{COMMENT_ID}">Go To</a></td> -->

</tr>
<!-- END comment_list -->
</table>
<hr>
<form method="post" action="">
<label for="comment">Comment:</label>
<textarea name="comment"></textarea>
<input type="hidden" name="url" value="<?php echo htmlentities($_SERVER['REQUEST_URI'])?>" />
<input type="submit" />
</form>