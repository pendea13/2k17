<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
var siteUrl='{SITE_URL}';
  function like(id)
  {
    var likes=$('span#likes_'+id).attr("no");
    $.ajax({
        url: siteUrl + "/gag/like",
        type: "POST",
        dataType: "Json",
        data : {id: id},
        success:function(response){
          var id = response['id'];
          var postId = response['postId'];
          var likes =response['likes'];
          if (response==false){
          window.location='{SITE_URL}/user/login/';
          }else {
            if (id == 1) {
              $("#like").text('unlike');
              $("span#likes_"+postId).text('[ '+likes+' ]');
            } else if(id == 0) {
              $("#like").text('like');
              $("span#likes_"+postId).text('[ '+likes+' ]');
            } else {
                $("#dislike").text('dislike');
                $("#like").text('like');
                $("span#likes_"+postId).text('[ '+likes+' ]');
              }
          }
        }
        });
  }
function dislike(id)
{
  var likes=$('span#likes_'+id).attr("no")
    $.ajax({
        url: siteUrl + "/gag/dislike",
        type: "POST",
        dataType: "Json",
        data : {id: id},
        success:function(response){
            var id = response['id'];
            var postId= response['postId'];
            var likes =response['likes'];
            if (response==false){
          window.location='{SITE_URL}/user/login/';
          }else {
              if (id == -1) {
                  $("#dislike").text('like');
                  $("span#likes_"+postId).text('[ '+likes+' ]');
              } else if(id == 0) {
                  $("#dislike").text('dislike');
                  $("span#likes_"+postId).text('[ '+likes+' ]');
              } else {
                  $("#dislike").text('dislike');
                  $("#like").text('like');
                  $("span#likes_"+postId).text('[ '+likes+' ]');
              }
            }
        }
    });
}
</script>
<!-- BEGIN gag_list -->
        <div class="box-shadow">
          <div class="box_header">
            Gag
          </div>
          <table class="medium_table security_check">
            <tr>
              <td>
              <a href="{SITE_URL}/gag/show/id/{GAG_ID}"><h1>{GAG_TITLE}</h1></a></td>
            </tr>
            <tr>
              <td class="rightalign"><a href="{SITE_URL}/gag/show/id/{GAG_ID}"><img src="{GAG_URLIMAGE}" width="420"></a></td>
            </tr>
            <tr>
              <td class="rightalign">
                </div>
                <span id ="likes_{GAG_ID}" no ='{GAG_LIKES}'>[ {GAG_LIKES} ]</span>
                <button onclick='like({GAG_ID});'  no ='{GAG_LIKES}' id="like">Like</button>
                <button onclick='dislike({GAG_ID});' no ='{GAG_LIKES}' id="dislike">Dislike</button>
                  <hr>
                  </table>
        </div>
        <!-- END gag_list -->