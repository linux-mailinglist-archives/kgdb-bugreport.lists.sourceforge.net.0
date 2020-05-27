Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C02A1E392A
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 27 May 2020 08:26:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jdpWj-00069n-Vp
	for lists+kgdb-bugreport@lfdr.de; Wed, 27 May 2020 06:26:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jdpWi-00069W-TQ
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 06:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tSNP35QYp6xethZiWpN7Amg3X+LW4hgKA/e4KGUMccc=; b=Sfn/jUTatMGKDYNWKW9onrfFtM
 zS8sH3SMT0BLEwfw2QdqittxZOYVgzufRAvNmDpIFJ+hpySfZWRiLerKCFpIBj0Dp5U+Wd+/hqlaI
 e+bvLTjeVTu8fGZBhW+9m+1lOVtHkYpBvne72jfkfwU1nVlE4TU1jSXRTdrb59aZjE1Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tSNP35QYp6xethZiWpN7Amg3X+LW4hgKA/e4KGUMccc=; b=iynZ3LXE0H/AFjmX6y3+lwSUN8
 NPaVFiNdD4GeFcHWcF+I/ho9knTXPLpe2i8mUsbKhQfUa7WdalAA4njtLlExJfdtvv8epZ6N/om8f
 rAq1XypCTbbluot8X6g5qnLd9jPwjjHGk56BCVURaVhSz0+EIiOT58/CtugHcqbUU0Ao=;
Received: from mail-pj1-f66.google.com ([209.85.216.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jdpWh-00EU7k-Ln
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 06:26:56 +0000
Received: by mail-pj1-f66.google.com with SMTP id cx22so1111442pjb.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 26 May 2020 23:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tSNP35QYp6xethZiWpN7Amg3X+LW4hgKA/e4KGUMccc=;
 b=G85xHZqLsrWZHmuuol1ub48HKxIZv5mdMUnm3b8yhDQMn6qJH4go9eNLKJHEduMHCw
 5oWiGqTR6R3Lvvs162rEhlcPapcPlp9s1LdpwgUxegA0hZkPCEEbHUlFw2/3jL0Cal8c
 Ald7vkGE8pEFiTwJftEVdcJnU4Bos8caP5Pi18190rIeTGVdbLLnGPZUA3+MpI6z86xe
 Axtl7GI6AkUDP+XLxRcgRSMd5a4tL7OlEiOnSwRh0YujnzdzkRNCN47W+u75SD8ENOcY
 4VahJAFqcN3JceEn3SOat3kt7OqkIjCpofGgPZ+LlmUX2Fp+nhYGTkuIqsGUvUMoeVco
 y81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tSNP35QYp6xethZiWpN7Amg3X+LW4hgKA/e4KGUMccc=;
 b=LdMpGrjS2CZUWgwc+NU7fIeLi+Wze/SpToXQUNCJoXckdfsaOuVG2lIgbde/JRM2P+
 hxRidgzHveDfAg8nKMUBH+RnraxOlssXczKVtWHwEOGZu+U/EmLGZfTV5uFw9LqG2NVT
 cXm+96+/Gs/TkgKfHOJk7SS8PUYpT1QvaoFnaz8+4YQJ7/Gs2gcZEfztUvlk9cHoRDFD
 Zhu8Gi7begcXSgejZLFVAZQ1kLC8MJ6otX+1I1PG+iJASdSSDPkTBcBUtn8Vdeqja+3w
 /mQxxBbj9Vbbf2m0HUP7BgKR6lKVc14kYfCe8muXHH8OygNHmeGp3XYrHfUuU61n96ha
 +v+w==
X-Gm-Message-State: AOAM530BXWjz724/SLZiJvrB8k1eYofM+9jkWYZRmxx2x9SfQR9tgzqR
 RTnzenBjB46LkqzGiDpaHu5pLXJsm8A=
X-Google-Smtp-Source: ABdhPJzEHo4EV0Nw7baAgnSJBBSDsFWrG9xwKApSsxlEfzYi9UM/tqokhAtut1Lf1zGSTCSpFgSJjA==
X-Received: by 2002:a17:902:b904:: with SMTP id
 bf4mr4500929plb.89.1590560810119; 
 Tue, 26 May 2020 23:26:50 -0700 (PDT)
Received: from localhost.localdomain ([117.252.68.136])
 by smtp.gmail.com with ESMTPSA id m12sm1239121pjs.41.2020.05.26.23.26.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 May 2020 23:26:49 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Wed, 27 May 2020 11:55:58 +0530
Message-Id: <1590560759-21453-4-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590560759-21453-1-git-send-email-sumit.garg@linaro.org>
References: <1590560759-21453-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.66 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jdpWh-00EU7k-Ln
Subject: [Kgdb-bugreport] [PATCH v3 3/4] kdb: Make kdb_printf robust to run
 in NMI context
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 jason.wessel@windriver.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

While rounding up CPUs via NMIs, its possible that a rounded up CPU
maybe holding a console port lock leading to kgdb master CPU stuck in
a deadlock during invocation of console write operations. So in order
to avoid such a deadlock, enable oops_in_progress prior to invocation
of console handlers.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 349dfcc..f848482 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -566,7 +566,17 @@ static void kdb_msg_write(char *msg, int msg_len)
 	for_each_console(c) {
 		if (!(c->flags & CON_ENABLED))
 			continue;
+		/*
+		 * While rounding up CPUs via NMIs, its possible that
+		 * a rounded up CPU maybe holding a console port lock
+		 * leading to kgdb master CPU stuck in a deadlock during
+		 * invocation of console write operations. So in order
+		 * to avoid such a deadlock, enable oops_in_progress
+		 * prior to invocation of console handlers.
+		 */
+		++oops_in_progress;
 		c->write(c, msg, msg_len);
+		--oops_in_progress;
 		touch_nmi_watchdog();
 	}
 }
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
