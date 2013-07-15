<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_diary_comment_list_all extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $this->set('inc_navi', fetch_inc_navi('h'));

        $page_size = 20;

        // リクエスト変数
        if (isset($requests['page'])) {
            $page = $requests['page'];
        } else {
            $page = 1;
        }

        // コメントがついた全ての日記をページを指定して取得する
        $result = k_p_fh_diary_list_c_diary_comment_list_all($page_size, $page);

        $list  = $result[0];
        $prev  = $result[1];
        $next  = $result[2];
        $count = $result[3];

        $this->set('new_diary_list', $list);
        $this->set('is_prev', $prev);
        $this->set('is_next', $next);

        $this->set('page', $page);

        $this->set('c_diary_search_list_count', $count);

        $pager = array();

        $pager['start'] = $page_size * ($page - 1) + 1;

        if (($pager['end'] = $page_size * $page) > $count) {
            $pager['end'] = $page_size * ($page - 1) + $count;
        }

        $this->set('page',  $page);
        $this->set('pager', $pager);

        //---- ページ表示 ----//
        return 'success';
    }
}

?>
