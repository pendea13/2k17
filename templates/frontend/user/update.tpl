<form action="{SITE_URL}/user/account/" method="post" enctype="multipart/form-data">
<input type="hidden" name="userToken" value="{USERTOKEN}">
	<ul class="form">
		<li class="clearfix">
			<h1> Welcome  <strong> {USERNAME} </strong><img src="{URLIMAGE}" width="100" height="100"></img></h1>
		</li>
		<li class="clearfix">
			<label for="firstName">First Name:</label>
			<input type="text" name="firstName" value="{FIRSTNAME}" id="firstName" />
		</li>
		<li class="clearfix">
			<label for="lastName">Last Name:</label>
			<input type="text" name="lastName" value="{LASTNAME}" id="lastName" />
		</li>
		<li class="clearfix">
			<label for="password">Password:</label>
			<input type="password" name="password" value="{PASSWORD}" id="password" />
		</li>
		<li class="clearfix">
			<label for="password2">Re-type Password:</label>
			<input type="password" name="password2" value="{PASSWORD}" id="password2" />
		</li>
		<li class="clearfix">
			<label for="email">Email:</label>
			<input id="email" type="text" name="email" value="{EMAIL}" />
		</li>
		<li class="clearfix">
			<label for="profilePicture">Profile Picture:</label>
			<input type="file" name="profilePicture"  />
			<input type="hidden" name="url" value="<?php echo htmlentities($_SERVER['REQUEST_URI'])?>" />
		</li>
		<li class="clearfix">
			<label class="empty">&nbsp;</label>
			<input type="submit" class="button" value="Update" />
		</li>
	</ul>
</form>