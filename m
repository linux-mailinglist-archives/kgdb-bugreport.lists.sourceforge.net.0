Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D6274C2B
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 25 Jul 2019 12:50:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hqbKP-0002qz-EW
	for lists+kgdb-bugreport@lfdr.de; Thu, 25 Jul 2019 10:50:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <xywang.sjtu@sjtu.edu.cn>) id 1hqWOA-0000Nt-OF
 for kgdb-bugreport@lists.sourceforge.net; Thu, 25 Jul 2019 05:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8LxnI8Ev+oQDbZnfnCwdRavoM/ijdvHLapYSHx/D7f0=; b=eQPuA37VNjY6oJV8o5sgUAv+5D
 Q/BC+bD7vxG2OFboIHNH6IWwnU8mcSSxL/HN+UjhMycj+s+zZU+sD5xinzZSVg4q6MiA2BQXNObK+
 iIf4PJDWxj/jymZMVpWzAyGyi8dAzFq0TVew5gKOsnJqpUuC5rRQH4mYelCeTP9X00Ik=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8LxnI8Ev+oQDbZnfnCwdRavoM/ijdvHLapYSHx/D7f0=; b=PLNJLcNj+XUbmNIM0DpbNST9zG
 ZXpWnyiD/aee+mT0QkZ3UUhDET4vSfm/cuRvzPKoeD/0/j/CCdMNkUkwwauhgtDhJsvIvH/5uNYtN
 mpF73yOyqvg2pXSj0FVbM+Tk1SMg0eKJJLY0rLI7xvbmrsM2f2rVk/OpqpuZKGkdWyXw=;
Received: from smtp180.sjtu.edu.cn ([202.120.2.180])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hqWO8-00F2Sk-8N
 for kgdb-bugreport@lists.sourceforge.net; Thu, 25 Jul 2019 05:34:02 +0000
Received: from proxy01.sjtu.edu.cn (unknown [202.112.26.54])
 by smtp180.sjtu.edu.cn (Postfix) with ESMTPS id 522271008CBC3;
 Thu, 25 Jul 2019 13:33:51 +0800 (CST)
Received: from localhost (localhost [127.0.0.1])
 by proxy01.sjtu.edu.cn (Postfix) with ESMTP id 4720420424204;
 Thu, 25 Jul 2019 13:33:51 +0800 (CST)
X-Virus-Scanned: amavisd-new at proxy01.sjtu.edu.cn
Received: from proxy01.sjtu.edu.cn ([127.0.0.1])
 by localhost (proxy01.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id psmXCv-axSFJ; Thu, 25 Jul 2019 13:33:51 +0800 (CST)
Received: from xywang-pc.ipads-lab.se.sjtu.edu.cn (unknown [202.120.40.82])
 (Authenticated sender: xywang.sjtu@sjtu.edu.cn)
 by proxy01.sjtu.edu.cn (Postfix) with ESMTPA id 1C1E920424202;
 Thu, 25 Jul 2019 13:33:51 +0800 (CST)
From: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
To: 
Date: Thu, 25 Jul 2019 13:33:45 +0800
Message-Id: <20190725053345.5888-1-xywang.sjtu@sjtu.edu.cn>
X-Mailer: git-send-email 2.11.0
X-Spam-Score: 1.5 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [202.120.2.180 listed in list.dnswl.org]
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [202.120.40.82 listed in dnsbl.sorbs.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sjtu.edu.cn]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hqWO8-00F2Sk-8N
X-Mailman-Approved-At: Thu, 25 Jul 2019 10:50:25 +0000
Subject: [Kgdb-bugreport] [PATCH] kdb: replace snprintf with strscpy
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: kgdb-bugreport@lists.sourceforge.net, daniel.thompson@linaro.org,
 Wang Xiayang <xywang.sjtu@sjtu.edu.cn>, jason.wessel@windriver.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

As commit a86028f8e3ee ("staging: most: sound: replace snprintf
with strscpy") suggested, using snprintf without a format
specifier is potentially risky if the PROMPT environment
variable contains any format specifier. The variable can be set
via kdb_set() though by default it contains no format specifier.

Using strscpy is conservatively safe for any mistakenly
environment variable setting that leads to crash.

Signed-off-by: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
---
 kernel/debug/kdb/kdb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 9ecfa37c7fbf..4514c70fae09 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1303,7 +1303,7 @@ static int kdb_local(kdb_reason_t reason, int error, struct pt_regs *regs,
 		snprintf(kdb_prompt_str, CMD_BUFLEN, kdbgetenv("PROMPT"),
 			 raw_smp_processor_id());
 #else
-		snprintf(kdb_prompt_str, CMD_BUFLEN, kdbgetenv("PROMPT"));
+		strscpy(kdb_prompt_str, kdbgetenv("PROMPT"), CMD_BUFLEN);
 #endif
 		if (defcmd_in_progress)
 			strncat(kdb_prompt_str, "[defcmd]", CMD_BUFLEN);
-- 
2.11.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
