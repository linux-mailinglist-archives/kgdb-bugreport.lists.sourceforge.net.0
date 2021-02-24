Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F75323936
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 Feb 2021 10:11:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lEqCk-0005Uv-5g
	for lists+kgdb-bugreport@lfdr.de; Wed, 24 Feb 2021 09:11:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lEqCi-0005Ug-M6
 for kgdb-bugreport@lists.sourceforge.net; Wed, 24 Feb 2021 09:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wTo08982+SRCLKzowpo4WdQTuev/V4/nqg+2goUnX8U=; b=gKWVSSHtSY4yU1GzFeOI+5ZDWc
 Rb8ABMMg4agutD68X7ew5AbeafCt7xU0AQ93NdigxoM6/zOy8DziExjH4+ZdpKHFufcm74DW13Pcs
 jZgzpmJEOcAdD10EVyktoR6jXa2h5DguShjK93eCEvTt5a0qdtE86t5/zOLppiFrja+4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wTo08982+SRCLKzowpo4WdQTuev/V4/nqg+2goUnX8U=; b=X
 nkf2AWjCXbZL4oyKkaMulwbkKOf47MAq7YuOWfpKmqFf6GpFVn38PEX9KJGmj0guSFOi1cHZjFSBB
 HP91T6jBZDBh23fZf36uvSitTZHSCr+JWRXJehkRz1l+rfcArRHt69ep6I7EqAbK4VO/7OBgRVHZA
 D9Rcls0vhGpr/wi4=;
Received: from mail-vk1-f173.google.com ([209.85.221.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lEqCb-003SWL-Db
 for kgdb-bugreport@lists.sourceforge.net; Wed, 24 Feb 2021 09:11:32 +0000
Received: by mail-vk1-f173.google.com with SMTP id o67so245886vkc.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 24 Feb 2021 01:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wTo08982+SRCLKzowpo4WdQTuev/V4/nqg+2goUnX8U=;
 b=mjh+E6hzjGLNsory5HuqDkALHlHVGSepkPQlhN+i8cTQh9zCKQ1wMT2n2OxAPojvUH
 vXZ62JUdLNBHAS9G1spCc2a8bxyMam9bQlHSOMCDYFQazyJER0SiwmUtPIHKSfXv6DQg
 iY2GyoPkURFhHFshtdn7H32/eKneXvbyOPDJmTkq1TnqIqOrQGK2l4W2HfTB88bqyiFf
 NQJLiG9WC4lTjsVD2x/qIalSZSXjpRcpoI1t4gVa0eRUj57tA4IfB8hOX0D4pwZzE5Yq
 //VVHiyxoG/wZl3nh3/y60jhsN8lGF3DvN82Tp5k/VyAmOAS0BRm/hfhw9QWBrkHSHcx
 fFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wTo08982+SRCLKzowpo4WdQTuev/V4/nqg+2goUnX8U=;
 b=l68fB7M1AqJuz0+HFq3Cp9IkQL81XLvgO/BEccqLJjxVGoxnhLtbwAIa6RsZA6PsIo
 voE9Nz9VTEiNhrGFYYI8rw0yZaf+K5c8Jdw7VCK75LeuJT6k+TbZ2N97jlK18bvBjVnG
 Z4QgAv5xkmEESMqJT6Ep6ZjmE8R+Yp0Yz6MeHBlPD3Yb2rppQeYh511ULC86s0J24Jw6
 ijVm8V4DUPdJFQYUH9NiT0CBZTJ5PDzkJdDfIHNwZYAgGbWroFk/Ozk7r2C/doHvJyAv
 HTfxwsswPj9LigUwLp+gFaLR3l2zw+F5gAq0PVVKKil+h7eiIlASGrKF61wcNlcyDIrC
 8YMg==
X-Gm-Message-State: AOAM533DQQgi2NjevAFEva8RRtxZGxtB7tyLKjii81S9m4lnk4S2uu+q
 OgggKwDAWpy8orHA2b2TRy88rFil+i+5NQ==
X-Google-Smtp-Source: ABdhPJzgYGKeGutf/PkGMpFLC1AP3NyykDukQYFrcKKhJzsJLv3igC8E/Sjb44KT8BgZ4PLyoLtLRA==
X-Received: by 2002:a17:902:7887:b029:e3:8ef0:9a9d with SMTP id
 q7-20020a1709027887b02900e38ef09a9dmr31191575pll.2.1614154637564; 
 Wed, 24 Feb 2021 00:17:17 -0800 (PST)
Received: from localhost.localdomain ([122.173.196.104])
 by smtp.gmail.com with ESMTPSA id h75sm1445286pfe.162.2021.02.24.00.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 00:17:17 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Wed, 24 Feb 2021 13:46:52 +0530
Message-Id: <20210224081652.587785-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.173 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.173 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lEqCb-003SWL-Db
Subject: [Kgdb-bugreport] [PATCH] kgdb: Fix to kill breakpoints on initmem
 after boot
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
Cc: daniel.thompson@linaro.org, peterz@infradead.org, rostedt@goodmis.org,
 linux-kernel@vger.kernel.org, qy15sije@cip.cs.fau.de, mhiramat@kernel.org,
 jason.wessel@windriver.com, akpm@linux-foundation.org, stefan.saecherl@fau.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently breakpoints in kernel .init.text section are not handled
correctly while allowing to remove them even after corresponding pages
have been freed.

Fix it via killing .init.text section breakpoints just prior to initmem
pages being freed.

Suggested-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 include/linux/kgdb.h      |  2 ++
 init/main.c               |  1 +
 kernel/debug/debug_core.c | 11 +++++++++++
 3 files changed, 14 insertions(+)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 57b8885708e5..3aa503ef06fc 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -361,9 +361,11 @@ extern atomic_t			kgdb_active;
 extern bool dbg_is_early;
 extern void __init dbg_late_init(void);
 extern void kgdb_panic(const char *msg);
+extern void kgdb_free_init_mem(void);
 #else /* ! CONFIG_KGDB */
 #define in_dbg_master() (0)
 #define dbg_late_init()
 static inline void kgdb_panic(const char *msg) {}
+static inline void kgdb_free_init_mem(void) { }
 #endif /* ! CONFIG_KGDB */
 #endif /* _KGDB_H_ */
diff --git a/init/main.c b/init/main.c
index c68d784376ca..a446ca3d334e 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1417,6 +1417,7 @@ static int __ref kernel_init(void *unused)
 	async_synchronize_full();
 	kprobe_free_init_mem();
 	ftrace_free_init_mem();
+	kgdb_free_init_mem();
 	free_initmem();
 	mark_readonly();
 
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 229dd119f430..319381e95d1d 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -465,6 +465,17 @@ int dbg_remove_all_break(void)
 	return 0;
 }
 
+void kgdb_free_init_mem(void)
+{
+	int i;
+
+	/* Clear init memory breakpoints. */
+	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
+		if (init_section_contains((void *)kgdb_break[i].bpt_addr, 0))
+			kgdb_break[i].state = BP_UNDEFINED;
+	}
+}
+
 #ifdef CONFIG_KGDB_KDB
 void kdb_dump_stack_on_cpu(int cpu)
 {
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
