Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA807DA76B
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 28 Oct 2023 15:55:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qwjma-0005VT-Dg
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 28 Oct 2023 13:55:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <christophe.jaillet@wanadoo.fr>) id 1qwjmX-0005VC-7G
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 28 Oct 2023 13:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QDDAkjDTfNEpw/wshaLCFDIwV6LReU6Ggu0GJWjqj6Q=; b=F55KzbyGuSTd5D4etRa0XCD3NZ
 FBR0xyv90FcjzmKCMzd1av7STAvQJQPNYW9aafoRfYhKmxHIvtJzQGmFVwsUvWqz1K7nlvFUt2YZ5
 m64QJw5r3qJFm6H4WtEPqGpIyppmoK2b/h1A5cJe7UdbVyJbmVuCWCRS7XXGHDsLP0HM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QDDAkjDTfNEpw/wshaLCFDIwV6LReU6Ggu0GJWjqj6Q=; b=L
 YXggTyTykthLH0y51jzvFZdUsyHtlQmOH7poDNNQI8z0Gcy1EnKLQEXPs80RUyeSlN/8h6Df6lNut
 xBYAxBhMmGbtK5Wu3xNEsLOzvEh+K35bjbsasijCDzOsLZET29BOunZX/q3YIIATWW5904IsfN/bt
 UAf3CnGzHHznrIw0=;
Received: from smtp-22.smtpout.orange.fr ([80.12.242.22]
 helo=smtp.smtpout.orange.fr)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qwjmV-00CSIu-2o for kgdb-bugreport@lists.sourceforge.net;
 Sat, 28 Oct 2023 13:55:17 +0000
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id wjmMqrqoPLilFwjmMqmAXJ; Sat, 28 Oct 2023 15:55:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1698501308;
 bh=QDDAkjDTfNEpw/wshaLCFDIwV6LReU6Ggu0GJWjqj6Q=;
 h=From:To:Cc:Subject:Date;
 b=pczJLlS4Ft5Nsvs8VT0hKx66s+tQvUDKhbWvAV+q1ZWhNbgM8tNhTceHCv0wmjUeQ
 4ChR4r7nOQgaJcglERdNOyWwEN0NMK8yviJXFqpoePokbXMfQWoI/PqA+2OTZImwS8
 c3cQMTajHH3zR0e7tpni7NlgyLvk7PsgNuFtmKoiXNnX6yyZ7bUQsLTLiZfTtE9uH8
 IHOHzzNEu9EQurDmgr3UTpteovLjp2O69CtgNCB8FUMoG0PvBzuNjiIXtDzlttQqen
 RI8U5KtJaDHLQ/DmooE5dyrEJfFsldW/FK9ngV0OmRq0/3vBbLc9I6cZTr1B+thNqa
 YN6cPqqRRLQjQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 28 Oct 2023 15:55:08 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Martin Hicks <mort@sgi.com>
Date: Sat, 28 Oct 2023 15:55:00 +0200
Message-Id: <0b1790ca91b71e3362a6a4c2863bc5787b4d60c9.1698501284.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When appending "[defcmd]" to 'kdb_prompt_str', the size of
 the string already in the buffer should be taken into account. Switch from
 strncat() to strlcat() which does the correct test to avoid such an overflow.
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [80.12.242.22 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [80.12.242.22 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qwjmV-00CSIu-2o
Subject: [Kgdb-bugreport] [PATCH] kdb: Fix a potential buffer overflow in
 kdb_local()
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

When appending "[defcmd]" to 'kdb_prompt_str', the size of the string
already in the buffer should be taken into account.

Switch from strncat() to strlcat() which does the correct test to avoid
such an overflow.

Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 kernel/debug/kdb/kdb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 438b868cbfa9..e5f0bf0f45d1 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1350,7 +1350,7 @@ static int kdb_local(kdb_reason_t reason, int error, struct pt_regs *regs,
 		snprintf(kdb_prompt_str, CMD_BUFLEN, kdbgetenv("PROMPT"),
 			 raw_smp_processor_id());
 		if (defcmd_in_progress)
-			strncat(kdb_prompt_str, "[defcmd]", CMD_BUFLEN);
+			strlcat(kdb_prompt_str, "[defcmd]", CMD_BUFLEN);
 
 		/*
 		 * Fetch command from keyboard
-- 
2.34.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
