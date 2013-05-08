<?php
/**
 * @copyright 2008 Naoya Shimada
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_amazoncmd extends OpenPNE_Action
{
    function handleError()
    {
        openpne_redirect('pc', 'page_h_home');
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $asin = $requests['id'];
        // ----------

        if (!isset($asin)) {
            return null;
        }

        if (AMAZON_AFFID) {
            //AmazonアソシエイトIDがセットされている場合
            $affid = AMAZON_AFFID;
        } else {
            //AmazonアソシエイトIDが未指定の場合は、作者のID (^_^;
            $affid = 'shima3-22';
        }

        // --- Amazonから情報取得
        require_once 'Services/AmazonECS4.php';

        //インスタンス化
        $amazon =& new Services_AmazonECS4(AMAZON_TOKEN, $affid);
        $amazon->setLocale(AMAZON_LOCALE);
        $amazon->setBaseUrl(AMAZON_BASEURL);
        if (defined('OPENPNE_USE_HTTP_PROXY') && OPENPNE_USE_HTTP_PROXY) {
            $amazon->setProxy(OPENPNE_HTTP_PROXY_HOST, OPENPNE_HTTP_PROXY_PORT);
        }

        //キャッシュ
        require_once 'Cache.php';
        $container_options = array(
            'cache_dir' => OPENPNE_RSS_CACHE_DIR . '/',
            'filename_prefix' => 'amazon_',
        );
        $amazon->setCache('file', $container_options);
        $amazon->setCacheExpire(86400); // 1day = 60 * 60 * 24

        //情報取得
        $options = array();
        $options['ResponseGroup'] = 'Large';
        $result = $amazon->ItemLookup($asin, $options);

        if (PEAR::isError($result)) {
            return false;
        }
        if (empty($result['Request']['IsValid']) || $result['Request']['IsValid'] !== 'True') {
            return null;
        }

        $product  = $result['Item'][0];
        if (is_array($product['ItemAttributes']['Author'])) {
            $authors = array_unique($product['ItemAttributes']['Author']);
            $product['author'] = implode(', ', $authors);
        }
        if (is_array($product['ItemAttributes']['Artist'])) {
            $artists = array_unique($product['ItemAttributes']['Artist']);
            $product['artist'] = implode(', ', $artists);
        }

        $this->set('ASIN',    $asin);
        $this->set('AFFID',   $affid);
        $this->set('product', $product);

        $view =& $this->getView();
        $view->ext_display('h_amazoncmd.tpl');
        exit;
    }
}

?>
