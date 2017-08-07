<form action="" method="post" enctype="multipart/form-data">
<label for="content">Title:</label>
<input type="text" name="title">
<p>Picture:
<input type="file" name="picture" />
<input type="hidden" name="url" value="<?php echo htmlentities($_SERVER['REQUEST_URI'])?>" />
<input type="submit" />
</p>
</form>