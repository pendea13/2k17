<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9">
	<title>{PAGE_TITLE}</title>
	<link rel="apple-touch-icon" href="{SITE_URL}/images/apple-touch-icon.png">
	<meta name="keywords" content="{PAGE_KEYWORDS}" >
	<meta name="description" content="{PAGE_DESCRIPTION}" >
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="canonical" href="{CANONICAL_URL}" >
	<link rel="stylesheet" href="{TEMPLATES_URL}/css/frontend/style.css" type="text/css" >
	<link rel="stylesheet" href="{SITE_URL}/externals/fonts/stylesheet.css" type="text/css" >
	<script src="{SITE_URL}/externals/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="{TEMPLATES_URL}/js/frontend/main.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<!--[if lt IE 9]>
	<script src="{TEMPLATES_URL}/js/frontend/html5shim.js"></script>
	<![endif]-->
</head>
<body>

		<header >
		<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
		<div class="navbar-header">

					<h1><a class="navbar-brand" href="{SITE_URL}/"><img height="35" width="50" src="{SITE_URL}/images/2K17-logo.png"></a></h1>
						<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>


				</div>
				<div class="navbar-collapse collapse" id="navbar-main">
				{MENU_TOP}
				</div>
			</div>
			</div>
		</header>


			<div class="container">
			<div class="jumbotron">
				<!-- <h1>{PAGE_CONTENT_TITLE}</h1> -->
				{MESSAGE_BLOCK}
				{MAIN_CONTENT}
				</div>
			<div class="clear"></div>
			</div>
		
		<div id="push"></div>
	
	<footer>
		<div id="footer-content">
			{MENU_FOOTER}
		</div>
		<div class="debugger">
			{DEBUGGER}
		</div>
	</footer>
</body>
</html>
