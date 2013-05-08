#!/bin/sh
PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin
cd /home/otaking-ex/MembersPNE2/bin/
/usr/local/bin/php tool_rss_cache.php >/dev/null 2>&1
cd /home/otaking-ex/MembersPNE2/bin/
/usr/local/bin/php tool_send_dairy_news.php >/dev/null 2>&1
cd /home/otaking-ex/MembersPNE2/bin/
/usr/local/bin/php tool_send_schedule_mail.php >/dev/null 2>&1
cd /home/otaking-ex/MembersPNE2/bin/
/usr/local/bin/php tool_send_birthday_mail.php >/dev/null 2>&1
