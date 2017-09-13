<script>
    function updateNews(id) {
        $.ajax({
            url: siteUrl + "/gag/update-news",
            type: "POST",
            dataType: "Json",
            data: {id: id,},
            success: function(response) {
                if (response == false) {
                    window.location = '{SITE_URL}/user/login/';
                } else {
                        $("b").text(response["news"]);

                }
            }
        });
    }
</script>
  

<ul id="top_menu" class="nav navbar-nav">

	<li class="{SEL_PAGE_CODING-STANDARD}">
		<a href="{SITE_URL}/gag/list-by-rank">Trend</a> 
	</li>
	<li class="{SEL_PAGE_CODING-STANDARD}">
		<a href="{SITE_URL}/gag/list-by-date">New</a> 
	</li>
	<!-- BEGIN top_menu_not_logged -->
	<li class="{SEL_USER_LOGIN}">
		<a href="{SITE_URL}/user/login">Log In</a>
	</li>
	<li class="{SEL_USER_REGISTER}">
		<a href="{SITE_URL}/user/register">Register</a>
	</li>
	<!-- END top_menu_not_logged -->
	<!-- BEGIN top_menu_logged -->
		<li class="{SEL_PAGE_CODING-STANDARD}">
		<a href="{SITE_URL}/gag/list-by-user">My Gag`s</a> 
	</li>
	<li class="{SEL_USER_ACCOUNT}">
		<a href="{SITE_URL}/user/account">{USERNAME_LOGGED}</a>
	</li>
	<ul class="nav navbar-nav navbar-right">
		<li class="dropdown">
			<a onclick="updateNews('{UPDATE_NEWS}');" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Notification (<b>{NOTIFICATIONS}</b>)</a>
			<ul class="dropdown-menu notify-drop">
				<div class="notify-drop-title">
					<div class="row">
						<div class="col-md-6 col-sm-6 col-xs-6">Notification (<b>{NOTIFICATIONS}</b>)</div>
					</div>
				</div>
				<div class="drop-content">
					<!-- BEGIN news -->
					<li>
						<div class="col-md-3 col-sm-3 col-xs-3 "><div class="notify-img"><img src="{NEWS_URLIMAGE}" width="50" height="50"  alt=""></div></div>
						<div class="col-md-9 col-sm-9 col-xs-9 pd-l0"><a href="{SITE_URL}/user/user-details/id/{NEWS_ID_USER_MADE}">{NEWS_USERNAME}</a>

							<p>{NEWS_TYPE}</p>
							<p class="time">{NEWS_TIME}</p>
						</div>
					</li>
					<!-- END news -->


				</div>
				<div class="notify-drop-footer text-center">
					<a href=""><i class="fa fa-eye"></i> More</a>
				</div>
			</ul>
		</li>
	</ul>
	<li>
		<a href="{SITE_URL}/user/logout">Log Out</a>
	</li>
	<!-- END top_menu_logged -->
</ul>

