Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4952C31F595
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 19 Feb 2021 09:03:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lD0lD-0007pX-2Q
	for lists+kgdb-bugreport@lfdr.de; Fri, 19 Feb 2021 08:03:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lD0lB-0007oy-ND
 for kgdb-bugreport@lists.sourceforge.net; Fri, 19 Feb 2021 08:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MhXeuyvm8uTbmAfHrQDEaA0duTq/sCZgbklnifZ5wLY=; b=nTFMNfvRlBXpzJNQN/U4LNrcqp
 LJiEQ9pJMn0iPCoKVgKyEgYOKZv4zXEkNwTTbf0gf6Tmd4cMAhufW0AeVKIn1tcjhEWxVNHOHd30y
 aD0v8PblBJNTMC6Rk8Q45hP3KI8+bTDwMNkziRLesdao0gg7zWQy5grAVNAqIuNL1Yc0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MhXeuyvm8uTbmAfHrQDEaA0duTq/sCZgbklnifZ5wLY=; b=ZaGUc+GNBw4HAJUkg+RPlqfIkf
 cshEadEIprRXsZQWfKSMpgscpwJlhkjZ/V9fLHJtIT2q0DGd6+mcVO3bP0ElvgSkJG+3WHps2Rt/i
 lSZB1+yxU19OYfqggulxWEM4wqTx1BoFVur72l/BVzBsZxNazPUUpJ0GTTxmN+Ap/HzY=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lD0l3-00F2ig-FA
 for kgdb-bugreport@lists.sourceforge.net; Fri, 19 Feb 2021 08:03:33 +0000
Received: by mail-pl1-f178.google.com with SMTP id k22so2933731pll.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 Feb 2021 00:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=MhXeuyvm8uTbmAfHrQDEaA0duTq/sCZgbklnifZ5wLY=;
 b=GFVxB4gPy6Btk4zFDDPDn5D3LXG90FLWsBVtQwCmbJaiYdKyZIKqm6DQsLao47vdF8
 1RpTVKi8igHur6XMuj7/FmWf2NygjffsaC6uDb9mXX0K7SHU/tARUkaKyyfcCQ1Eg4OC
 SCW1ZTgnyHZvqG90WZWkW0SAFKYSxAYzou8fY8wKeDYHoHL401TLk6laNtL/lTInUpkO
 nh8sW5ZEYzn8t+TGhV7RC43O4o8BSlsNH6wOiKZzrzDxfg2iIYiKvPBZVjkZEW0p1h38
 Rf/qY2EUsJQG2CAuLNHrFpMS2qQYX52VL08RNwfLJSAxjK8V++MhrzeCrImrEqXrSs2v
 kfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MhXeuyvm8uTbmAfHrQDEaA0duTq/sCZgbklnifZ5wLY=;
 b=Ur8dmgFF+pX6CdIGA+4qHol324zZNMXJ8AClIoWXr6qzjVouUyo6ewrbE+1uOETyvB
 ySvi5ryxm4QSY0ZWby6ktnfyPOjFILMawiIrciVM7TAof0jeljhlGBd0FpYp6NLYsqUS
 CT3W4e5COr0/fbKa4myUL+SXpgzZDyPsSHFtnGEoynQbJ9SYpdUD3tENGx0VP5DNU7Qk
 QD58cghELP8pf4nUq2dnldpBFQq6YlEsYam6RL/M/sWPEVU+65nW0nnLk/G18I7Cm5g+
 QR0VXLvGGyg9oNmJUOXSrkc9vO/SdnMlIO9OVPmQlJ4YiJcaw7VljBqsuTOY/r/ReONq
 a5ww==
X-Gm-Message-State: AOAM530jK6Vs1gjOp9qjYhIIDft2xIOFjrvmJjwO7z0bC1phOgwRF6nU
 oB7dnBh2mfqckehCNbqq5+IR5GF4LHplng==
X-Google-Smtp-Source: ABdhPJw18quszC4COmeXXlaCjmhhguhzV/g5qTt8aUT/kHc7o5Mc59BFbMwZB3w+sGIvN1gE2Ctn5w==
X-Received: by 2002:a17:90b:1a8b:: with SMTP id
 ng11mr8455843pjb.160.1613721799493; 
 Fri, 19 Feb 2021 00:03:19 -0800 (PST)
Received: from localhost.localdomain ([122.173.196.104])
 by smtp.gmail.com with ESMTPSA id lj11sm7463845pjb.2.2021.02.19.00.03.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 00:03:18 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Fri, 19 Feb 2021 13:31:34 +0530
Message-Id: <1613721694-16418-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.178 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lD0l3-00F2ig-FA
Subject: [Kgdb-bugreport] [PATCH] kernel: debug: Handle breakpoints in
 kernel .init.text section
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
Cc: daniel.thompson@linaro.org, peterz@infradead.org,
 linux-kernel@vger.kernel.org, qy15sije@cip.cs.fau.de,
 jason.wessel@windriver.com, stefan.saecherl@fau.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently breakpoints in kernel .init.text section are not handled
correctly while allowing to remove them even after corresponding pages
have been freed.

In order to keep track of .init.text section breakpoints, add another
breakpoint state as BP_ACTIVE_INIT and don't try to free these
breakpoints once the system is in running state.

To be clear there is still a very small window between call to
free_initmem() and system_state = SYSTEM_RUNNING which can lead to
removal of freed .init.text section breakpoints but I think we can live
with that.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 include/linux/kgdb.h      |  3 ++-
 kernel/debug/debug_core.c | 17 +++++++++++++----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 0d6cf64..57b8885 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -71,7 +71,8 @@ enum kgdb_bpstate {
 	BP_UNDEFINED = 0,
 	BP_REMOVED,
 	BP_SET,
-	BP_ACTIVE
+	BP_ACTIVE_INIT,
+	BP_ACTIVE,
 };
 
 struct kgdb_bkpt {
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index af6e8b4f..229dd11 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -324,7 +324,11 @@ int dbg_activate_sw_breakpoints(void)
 		}
 
 		kgdb_flush_swbreak_addr(kgdb_break[i].bpt_addr);
-		kgdb_break[i].state = BP_ACTIVE;
+		if (system_state >= SYSTEM_RUNNING ||
+		    !init_section_contains((void *)kgdb_break[i].bpt_addr, 0))
+			kgdb_break[i].state = BP_ACTIVE;
+		else
+			kgdb_break[i].state = BP_ACTIVE_INIT;
 	}
 	return ret;
 }
@@ -378,8 +382,13 @@ int dbg_deactivate_sw_breakpoints(void)
 	int i;
 
 	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
-		if (kgdb_break[i].state != BP_ACTIVE)
+		if (kgdb_break[i].state < BP_ACTIVE_INIT)
+			continue;
+		if (system_state >= SYSTEM_RUNNING &&
+		    kgdb_break[i].state == BP_ACTIVE_INIT) {
+			kgdb_break[i].state = BP_UNDEFINED;
 			continue;
+		}
 		error = kgdb_arch_remove_breakpoint(&kgdb_break[i]);
 		if (error) {
 			pr_info("BP remove failed: %lx\n",
@@ -425,7 +434,7 @@ int kgdb_has_hit_break(unsigned long addr)
 	int i;
 
 	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
-		if (kgdb_break[i].state == BP_ACTIVE &&
+		if (kgdb_break[i].state >= BP_ACTIVE_INIT &&
 		    kgdb_break[i].bpt_addr == addr)
 			return 1;
 	}
@@ -439,7 +448,7 @@ int dbg_remove_all_break(void)
 
 	/* Clear memory breakpoints. */
 	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
-		if (kgdb_break[i].state != BP_ACTIVE)
+		if (kgdb_break[i].state < BP_ACTIVE_INIT)
 			goto setundefined;
 		error = kgdb_arch_remove_breakpoint(&kgdb_break[i]);
 		if (error)
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
