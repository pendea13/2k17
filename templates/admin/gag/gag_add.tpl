<form action="" method="post" enctype="multipart/form-data">
<div class="box-shadow" style="width: 500px">
		<div class="box_header">
			Add New Gag
		</div>
		<ul class="form">
			<li class="clearfix">
				<label>Title<span class="required">*</span></label>
				<input type="text" name="title" >
			</li>
			<li class="clearfix">
				<label>Picture:<span class="required">*</span></label>
				<input type="file" name="picture" />
				<input type="hidden" name="url" value="<?php echo htmlentities($_SERVER['REQUEST_URI'])?>" />
			</li>
			<li class="clearfix">
				<label>&nbsp;</label>
				<input type="submit" class="button">
			</li>
		</ul>
	</div>
</form>