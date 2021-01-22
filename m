Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4273E300123
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 Jan 2021 12:06:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l2uGw-00049L-21
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 Jan 2021 11:06:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l2uGu-000490-IQ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 Jan 2021 11:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8xmowMygRP96q6ZfQepL38bbSA5RtX+xDKaDnp6OZZo=; b=jxnH06kCE9sSMVXE26ZgeAxgvl
 a++FalDn9KHB/NEeyxbUfIItxyyUQbMmm2m6W+70k42qCNP/50FHO2ZtcmNvHKcJaf8W0peRW1QxQ
 hGoDC3FFIjxHxBPueEN/Snk4eA7p2ytUTVfWJFdcrApJxcFDwuGwHvnarh6opDJwqmdc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8xmowMygRP96q6ZfQepL38bbSA5RtX+xDKaDnp6OZZo=; b=JqCgd8Y+M0gxybY8EGJEwDZQiv
 jaTvUaBbz7V8kG6Fp5YpRbyh8vB5xWgPAgDI4joZ45Jl5FnqoR5Lk1TqwZ97u/cXgDZ4JZSwHdG8w
 fgRPi9W3JUJx9eHZz3Pp6IfGxtOcbLamyK161Ls2pJrEdJ8sf1TmPQUL87LN+5vJpbzw=;
Received: from mail-pg1-f171.google.com ([209.85.215.171])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l2uGk-00GBih-2H
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 Jan 2021 11:06:32 +0000
Received: by mail-pg1-f171.google.com with SMTP id c132so3474211pga.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 Jan 2021 03:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=8xmowMygRP96q6ZfQepL38bbSA5RtX+xDKaDnp6OZZo=;
 b=xRAWJg9uWyvrqCaVbaGDdjfC4XRsikv5lqCfNDaWh8BruWcMsnByoGA5IerSTm4iLs
 IfocfLfTFc1n302KZOhl75FOqrKzBRaL3p8dhxhuMc6rzBc3hVp6/sysJJDRo/yQAL0a
 G9ok1GyFpyD3+RmFx6m1O4t+yCM2Foy3AHMkg7eQmFACmTQD3hgi2/PtUJZPV9lXX/O1
 npcolHS9Hz6jth/kq/FBvjUahiuiIMWuM8T6WA9sRlekgcPftdYBDwaGdlz2zI5/GgfL
 fhcnkCXn2jq71kYxLQNDNBBPTUVHzm1CuZUPl71eEoBunw7ejl9M0RfgFScOhTzszAFY
 BPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8xmowMygRP96q6ZfQepL38bbSA5RtX+xDKaDnp6OZZo=;
 b=pHqdmz2M0Q9DWRTq/kclpjyxzW1ecfSLf0HD2OahqnmAF8Xh9/Kl2trqlTwtbzuK2m
 dBdbUa4mjq033HtGNv0aYt5IuE8YZrqwuyzZTXotaw39ZiTrzLhnImHM+zTs9DLtZu/E
 yyMlKQbV0nFrsJwTXQYjR4SQZbBI9NC8h+fkErob5H4Z8zd1tD1FRm15dxP+HPt4ybRT
 JF9sl/LLGxkfih2O8BYP1Y6ibZiGMW0J4X75LoM+0u9rh5ErK0vGfVOAnhyX18ma+zH9
 O1DsR0lUOZgLW/H4UeUF5x1WTdPU3KgBu4YGENGo9A7uOaZxljwsfqoMBE2Hdb38bpTx
 QC3Q==
X-Gm-Message-State: AOAM532PhPwwMtSi1Rg2nhVuBzFWDdGAs/SZAnGfm9tkK52pA+Krz4/Z
 0QzbImOSUOTF8tKmt3R2tz4ECiiu8s7Qbg==
X-Google-Smtp-Source: ABdhPJw9OXYA0Ves4zH7Zwge3APRupjHpxKEZURTnQT2SSrlD8+pcogSCSV9X4HvSz9Fw7OVlfcWLg==
X-Received: by 2002:a65:4549:: with SMTP id x9mr4253916pgr.6.1611313575903;
 Fri, 22 Jan 2021 03:06:15 -0800 (PST)
Received: from localhost.localdomain ([122.173.53.31])
 by smtp.gmail.com with ESMTPSA id j3sm8854562pjs.50.2021.01.22.03.06.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 03:06:15 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Fri, 22 Jan 2021 16:35:56 +0530
Message-Id: <1611313556-4004-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [122.173.53.31 listed in dnsbl.sorbs.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.171 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l2uGk-00GBih-2H
Subject: [Kgdb-bugreport] [PATCH v3] kdb: Make memory allocations more robust
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
Cc: daniel.thompson@linaro.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, jason.wessel@windriver.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently kdb uses in_interrupt() to determine whether its library
code has been called from the kgdb trap handler or from a saner calling
context such as driver init. This approach is broken because
in_interrupt() alone isn't able to determine kgdb trap handler entry from
normal task context. This can happen during normal use of basic features
such as breakpoints and can also be trivially reproduced using:
echo g > /proc/sysrq-trigger

We can improve this by adding check for in_dbg_master() instead which
explicitly determines if we are running in debugger context.

Cc: stable@vger.kernel.org
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Changes in v3:
- Refined commit description and Cc: stable@vger.kernel.org.

Changes in v2:
- Get rid of redundant in_atomic() check.

 kernel/debug/kdb/kdb_private.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index 7a4a181..344eb0d 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -231,7 +231,7 @@ extern struct task_struct *kdb_curr_task(int);
 
 #define kdb_task_has_cpu(p) (task_curr(p))
 
-#define GFP_KDB (in_interrupt() ? GFP_ATOMIC : GFP_KERNEL)
+#define GFP_KDB (in_dbg_master() ? GFP_ATOMIC : GFP_KERNEL)
 
 extern void *debug_kmalloc(size_t size, gfp_t flags);
 extern void debug_kfree(void *);
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
