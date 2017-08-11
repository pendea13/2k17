<form method="post" action="">
<label for="content">Comment:</label>
<textarea name="content"></textarea>
<input type="hidden" name="url" value="<?php echo htmlentities($_SERVER['REQUEST_URI'])?>" />
<input type="submit" />
</form>