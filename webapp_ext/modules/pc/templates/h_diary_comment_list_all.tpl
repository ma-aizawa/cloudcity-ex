<div id="LayoutC">
<div id="Center">

({if $c_diary_search_list_count})
    ({* {{{ searchResultList *})
        <div class="dparts searchResultList"><div class="parts">

        <div class="partsHeading"><h3>最新コメントがついた日記一覧</h3></div>

        ({capture name=pager})({strip})
        <div class="pagerRelative">
            ({if $is_prev})
                <p class="prev">
                    <a href="({t_url m=pc a=page_h_diary_comment_list_all})&amp;page=({$page-1})">前を表示</a>
                </p>
            ({/if})
            <p class="number">({$pager.start})件～({$pager.end})件を表示</p>
            ({if $is_next})
                <p class="next">
                    <a href="({t_url m=pc a=page_h_diary_comment_list_all})&amp;page=({$page+1})">次を表示</a>
                </p>
            ({/if})
        </div>
        ({/strip})({/capture})

        ({$smarty.capture.pager|smarty:nodefaults})

        <div class="block">
            ({foreach from=$new_diary_list item=diary})
                <div class="ditem">
                <div class="item">
                <table>
                    <tr>
                        <td class="photo" rowspan="4"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$diary.c_diary_id})"><img src="({t_img_url filename=$diary.c_member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
                        <th>({$WORD_NICKNAME})</th><td>({$diary.c_member.nickname})({if $diary.c_member.profile.sex.value}) (({$diary.c_member.profile.sex.value}))({/if})</td>
                    </tr>
                    <tr>
                        <th>タイトル</th>
                        <td>({$diary.subject}) (({$diary.num_comment}))({if $diary.image_filename_1 || $diary.image_filename_2 || $diary.image_filename_3}) <img src="({t_img_url_skin filename=icon_camera})" alt="" />({/if})</td>
                    </tr>
                    <tr>
                        <th>本文</th>
                        <td>({$diary.body|t_decoration:1|t_truncate:36:"":3})</td>
                    </tr>
                    <tr class="operation">
                        <th>作成日時</th>
                        <td><span class="text">({$diary.r_datetime|date_format:"%m月%d日 %H:%M"})</span> <span class="moreInfo"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$diary.c_diary_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="詳細を見る" /></a></span></td>
                    </tr>
                </table>
                </div>
                </div>
            ({/foreach})
        </div>

        ({$smarty.capture.pager|smarty:nodefaults})

        </div></div>
    ({* }}} *})

({else})
    ({* {{{ simpleBox *})
        <div class="dparts simpleBox">
            <div class="parts">
                <div class="partsHeading"><h3>({$WORD_DIARY})検索結果一覧</h3></div>
                <div class="block"><p>該当する({$WORD_DIARY})はありません。</p></div>
            </div>
        </div>
    ({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
