<?php
class Gag extends Dot_Model
{

	public function __construct()
	{
		parent::__construct();
	}
	//get a list of gags
	public function getGagList()
	{
		$select = $this->db->select()
						   ->from('post');
 		$result=$this->db->fetchAll($select);
 		$comepletedData = [];
		foreach ($result as $gag) {
			$comepletedData[$gag['id']]['title'] = $gag['title'];
			$comepletedData[$gag['id']]['id'] = $gag['id'];
			$comepletedData[$gag['id']]['urlimage'] = $gag['urlimage'];
			$comepletedData[$gag['id']]['likes']=0;
			$likes= $this->getLikeByPost($gag['id']);
				foreach ($likes as $like) {
					$comepletedData[$gag['id']]['likes'] +=$like['like'];
				}


		}

		return $comepletedData;
	}
	// get details and likes for one post
	public function getGagById($id)
	{	
		$select = $this->db->select()
						   ->from('post')
						   ->where('id= ?',$id);

		$likes= $this->getLikeByPost($id);
		$result=$this->db->fetchRow($select);
		$result['likes']=0;
		foreach ($likes as $like) {
		$result["likes"]+=$like['like'];
		}
		return $result;

	}
	//get comment by id
	public function getCommentById($id)
	{	
		$select = $this->db->select()
						   ->from('comment')
						   ->where('id= ?',$id);
		$result=$this->db->fetchAll($select);
		return $result;

	}
	//get the comment by the gag id
	public function getComments($gagId)
	{
		$select=$this->db->select()
						->from('comment')
						->where('idPost = ?', $gagId)
						->join('user', 'comment.idUser = user.id', ['username' => 'username']);
		$result=$this->db->fetchAll($select);
		return $result;
	}
	//gets all comments parents of an post
	public function getCommentsParents($gagId)
	{
		$select=$this->db->select()
						->from('comment')
						->where('idPost = ?', $gagId)
						->where('parent_id = ?', 0)
						->join('user', 'comment.idUser = user.id', ['username' => 'username']);
		$result=$this->db->fetchAll($select);
		return $result;
	}
	// making an array with comments and replys
	public function getCommentByArticleId($id)
	{
		$comepletedData = [];
		$parentsComments= $this->getCommentsParents($id);
		foreach ($parentsComments as $key => $value) {
			$replies = $this->getCommentReplytByCommentId($value['id']);
			$comepletedData[$value['id']]['content'] = $value['content'];
			$comepletedData[$value['id']]['idUser'] = $value['idUser'];
			$comepletedData[$value['id']]['username'] = $value['username'];
			$comepletedData[$value['id']]['date'] = $value['date'];
			$comepletedData[$value['id']]['parent_id'] = $value['parent_id'];
			$comepletedData[$value['id']]['id'] = $value['id'];
			if(isset($replies) && !empty($replies))
			{
				$comepletedData[$value['id']]['replies'] = $replies;
			}
		}
		return $comepletedData;
	}
	//get coment reply by coment id
	public function getCommentReplytByCommentId($id)
	{
		$select = $this->db->select()
	                    ->from('comment',array('content','date','idUser', 'id','parent_id'))
	                    ->where('parent_id = ?', $id)
	                    ->join('user','user.id = comment.idUser','username');
	    $result = $this->db->fetchAll($select);
	    return $result;
	}
	// add a new Gag with post method
	public function addGag($data)
	{

		$this->db->insert('post',$data);
	}
	// add a new comment for an atricle with post method
	public function addComment($data)
	{

		$this->db->insert('comment',$data);
	}
	//update gag
	public function updateGag($data , $id)
	{
		$this->db->update('post', $data, 'id = '.$id);
	}
	// delete gag
	public function deleteGag($id)
	{
		$this->db->delete('post', 'id = ' . $id);
	}
	//delet comment
	public function deleteComment($id)
	{
		$this->db->delete('comment', 'id = ' . $id);
		$this->db->delete('comment', 'parent_id = ' . $id);
	}
	 //updates a comment into the table comment
    public function editCommentById($a, $commentId)
    {
        $this->db->update('comment', $a, 'id = ' . $commentId);
    }
    //add Like or dislke on gag
    public function addLikeOrDislikeGag($data)
    {
    	$this->db->insert('postLike',$data);
    }
    //edit like on gag
    public function editLike($a,$likeId)
    {
    	$this->db->update('postLike', $a, 'id = ' . $likeId);
    }
    // get like on id post and id user
    public function getLike ($postId, $userId)
    {
    	$select = $this->db->select()
						   ->from('postLike')
						   ->where('id_post= ?', $postId)
						   ->where('id_user= ?', $userId);
		$result=$this->db->fetchRow($select);
		return $result;
    }
    // get like on id post
    public function getLikeByPost ($postId)
    {
    	$select = $this->db->select()
						   ->from('postLike')
						   ->where('id_post= ?', $postId);
		$result=$this->db->fetchAll($select);
		return $result;
    }
}