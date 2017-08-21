<?php
class Gag_View extends View
{

	public function __construct($tpl)
	{
		$this->tpl = $tpl;
		$this->settings = Zend_Registry::get('settings');
		$this->session = Zend_Registry::get('session');
	}
	public function showGagList($templateFile='', $gagList )
	{ 
		if ($templateFile != '') $this->templateFile = $templateFile;
		$this->tpl->setFile('tpl_main', 'gag/' . $this->templateFile . '.tpl');
		$this->tpl->setBlock('tpl_main','gag_list',"gag_list_block");
		
		foreach ($gagList as $gag) {
			foreach ($gag as $gagKey => $gagValue) {
			$this->tpl->setVar(strtoupper("GAG_".$gagKey), $gagValue);
			}
			$this->tpl->parse("gag_list_block", 'gag_list', true);
		}
	}
	public function showGagEdit($templateFile='', $gagList)
	{ 
		if ($templateFile != '') $this->templateFile = $templateFile;
		$this->tpl->setFile('tpl_main', 'gag/' . $this->templateFile . '.tpl');
		foreach ($gagList as $gag) {
			foreach ($gag as $gagKey => $gagValue) {
			$this->tpl->setVar(strtoupper("GAG_".$gagKey),$gagValue);
			}
		}
	}
	//add template for adding gag
	public function showAddGag($templateFile="" )
	{
		if ($templateFile != '') $this->templateFile = $templateFile;
		$this->tpl->setFile('tpl_main', 'gag/' . $this->templateFile . '.tpl');
	}
	// showing gag by id
	public function showGagById($templateFile='', $article)
	{ 
		if ($templateFile != '') $this->templateFile = $templateFile;
		$this->tpl->setFile('tpl_main', 'gag/' . $this->templateFile . '.tpl');
			foreach ($article as $articleKey => $articleValue) {
			$this->tpl->setVar(strtoupper("GAG_".$articleKey),$articleValue);
			}
	}
	public function showComment ($templateFile='', $comment){
		if ($templateFile != '') $this->templateFile = $templateFile;
		$this->tpl->setFile('tpl_main', 'gag/' . $this->templateFile . '.tpl');
		foreach ($comment as $context) {
			foreach ($context as $contextKey => $contextValue) {
			$this->tpl->setVar(strtoupper("COMMENT_".$contextKey),$contextValue);
			}
		}

	}
	// showing commend list for Gag
	public function showComments($templateFile='', $commentList)
	{
		if ($templateFile != '') $this->templateFile = $templateFile;
		$this->tpl->setFile('tpl_main', 'gag/' . $this->templateFile . '.tpl');
		$this->tpl->setBlock('tpl_main','comment_list',"comment_list_block");
		$this->tpl->setBlock('comment_list','comment_reply','comment_reply_block');
		$this->tpl->setBlock('comment_list','comment_list_buttones','comment_list_buttones_block');
		$this->tpl->setBlock('comment_reply','comment_reply_buttones','comment_reply_buttones_block');

		foreach ($commentList as $comment) {
			$this->tpl->setVar(strtoupper("COMMENT_USERNAME"),$comment['username']);
			$this->tpl->setVar(strtoupper("COMMENT_ID"),$comment['id']);
            $this->tpl->setVar(strtoupper("COMMENT_LIKES"),$comment['likes']);
			$this->tpl->setVar(strtoupper("COMMENT_CONTENT"),$comment['content']);
			$this->tpl->setVar(strtoupper("COMMENT_DATE"),$comment['date']);
			if (isset($this->session->user->id)){
				$this->tpl->parse('comment_list_buttones_block','');
				if ($comment['idUser']==$this->session->user->id){
					$this->tpl->parse("comment_list_buttones_block", 'comment_list_buttones', true);
				}
			}
			$this->tpl->parse('comment_reply_block','');

			if(isset($comment['replies'])) {
                foreach($comment['replies'] as $replyKey => $reply) {
                    $this->tpl->setVar('REPLY_USERNAME',$reply['username']);
                    $this->tpl->setVar('REPLY_ID',$reply['id']);
                    $this->tpl->setVar('REPLY_LIKES',$reply['likes']);
                    $this->tpl->setVar('REPLY_CONTENT',$reply['content']);
					$this->tpl->setVar('REPLY_DATE',$reply['date']);

                	if (isset($this->session->user->id)){
	                	$this->tpl->parse('comment_reply_buttones_block','');
						if ($reply['idUser']==$this->session->user->id){
							$this->tpl->parse("comment_reply_buttones_block", 'comment_reply_buttones', true);
						}
					}
					 $this->tpl->parse('comment_reply_block','comment_reply',true);
                    }
                   
                }
			
			$this->tpl->parse("comment_list_block", 'comment_list', true);
		}

	}


}