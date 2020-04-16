Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAB51AB5EE
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Apr 2020 04:38:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jOuQM-0003Cs-GI
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Apr 2020 02:38:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jOuQK-0003CV-Op
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Apr 2020 02:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=; b=DhzkkaiI5oht4LGQm2tzWcM59w
 oFzTo4CYzTAwSKs+/DlndDG9g+SdsfsHVALlRVeyzrnsRON8s5NKbh0tyHm6uynlSlINSk1SmkQAZ
 3X7w3Dgc++WaUhZdSkH2r3dMsdOY2gzeDYbE+DvPArwwvnl2VWibA/pTkxxOaDUC2DwE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=; b=mV9Y1YzTGy92aZhrrxCukFrIdI
 kt+HtqtvOtKDOlFUQGtCfZqFN1+dclIUudL4bReDv3NgndvuHYvGbXurdRI74am0r6fYFkVxhlmC/
 iv7NAuNBNe6jWD9eXOxrBf9KntRuu1wIg0QU9LYisnYuUwupAXf7xAFTcG6dRrYkuZ+8=;
Received: from mail-pj1-f68.google.com ([209.85.216.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jOuQG-003QvA-Vp
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Apr 2020 02:38:40 +0000
Received: by mail-pj1-f68.google.com with SMTP id t40so725396pjb.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 15 Apr 2020 19:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=;
 b=C/HFZhb/VBa+5fbIzMCnK9pU2PPhmSkmTZJxSmF3ptbNd0mCOMNO6Qw4f5UU2lKGCw
 gUuEsNNz0m+7GxqHbXzWrLK7x6Okc3SOgCoQq81DI+VUphwlT6Zc/PaE05u/W2628+1L
 ummBI7lfYLy4s5PzcLInAvsOm2Cja/PjadbkLvYGw+qD4Mhue6EEg+bg5xxlOjLZtLBB
 dizsIK+NOCwYmPH6v7yIJHL2xbpSRo1DEPNZJbl6wzr92CoQzehqaAlWvY8EmOoPUBvP
 PHDwoOTIBttAtrnAU5iUUZ1dTPMTXE+qhUvIsbEdWB58fJWhvd6fXn5047sGoS6vNDSK
 Y2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=;
 b=lL6jwlWOsy692JP6OcUHdPBG+OTphYye7v5kHW2r9zj8SYcRCQlv5CiyUn+VQSYDRf
 FvHpj7y21MhQ8owJn+6UIcoYypZKB1e0kXv0z//D1HJtIwK+ZUMCE2+G4Z7dlMdVz22I
 dtPRZKKrncmmfMrKN1hH+QpPWKk7HJnUwVAudjEP7TNj0HdEYlSAxFqRqj95gapmkWIq
 Miz5IZrmpB6iDerwBYssEcsES1c1zIjS1ds3M6IQSAFXO3efXOHAb7yHujtHXWDpcaNF
 bB9FXCJIPX+YZm+z1JI9l15bUII0836bF6WSe5p17Z/0qqdLKlER1mv14T3O8CqfXfGg
 3Tpw==
X-Gm-Message-State: AGi0PuYlrEKFL2/4L3qsAAntceJiQhghqGAIxxEJAedoBEwOfgS4URzu
 KnvWlg6TfrYDOO0R4cBcfweI3g==
X-Google-Smtp-Source: APiQypKCWhzi+OoAToima71fdEOLjpWXaW775yUGc7XWNuEnAPZruwtOOM9mJrJBtlQjq3BpmLz83g==
X-Received: by 2002:a17:90a:a40e:: with SMTP id
 y14mr2364584pjp.151.1587004711170; 
 Wed, 15 Apr 2020 19:38:31 -0700 (PDT)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id i25sm11347536pfd.140.2020.04.15.19.38.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Apr 2020 19:38:30 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, daniel.thompson@linaro.org
Date: Thu, 16 Apr 2020 10:38:04 +0800
Message-Id: <1587004688-19788-2-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587004688-19788-1-git-send-email-vincent.chen@sifive.com>
References: <1587004688-19788-1-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.68 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sifive.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jOuQG-003QvA-Vp
Subject: [Kgdb-bugreport] [PATCH v4 1/5] kgdb: Add kgdb_has_hit_break
 function
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-riscv@lists.infradead.org,
 Vincent Chen <vincent.chen@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The break instruction in RISC-V does not have an immediate value field, so
the kernel cannot identify the purpose of each trap exception through the
opcode. This makes the existing identification schemes in other
architecture unsuitable for the RISC-V kernel. To solve this problem, this
patch adds kgdb_has_hit_break(), which can help RISC-V kernel identify
the KGDB trap exception.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/debug_core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 2b7c9b67931d..01bc3eea3d4d 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -417,6 +417,18 @@ int kgdb_isremovedbreak(unsigned long addr)
 	return 0;
 }
 
+int kgdb_has_hit_break(unsigned long addr)
+{
+	int i;
+
+	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
+		if (kgdb_break[i].state == BP_ACTIVE &&
+		    kgdb_break[i].bpt_addr == addr)
+			return 1;
+	}
+	return 0;
+}
+
 int dbg_remove_all_break(void)
 {
 	int error;
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
