Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AC1186E57
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 16 Mar 2020 16:12:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xvTDq9uy7+OVh4lvnL6UXE4tVCPDKfuihrZXdxtaNuc=; b=dq2lYpBfEexnM4+eP2BiTxpuN
	cikTdF84tO2yV6S13BvDeqwyaOQ2z/XO78kSUdCeEgKZVbuHvLYAxmhy48S4adX2FYrBXnai2l9P9
	tgWqGIZGPSCHyBOmatSHVPRHIXpK7muXBHqQnMS9K5INWv4zmMwH13Q9kpGLEyTVnDUt8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jDrQC-00019a-BN
	for lists+kgdb-bugreport@lfdr.de; Mon, 16 Mar 2020 15:12:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dima@arista.com>) id 1jDrQA-00019M-C8
 for kgdb-bugreport@lists.sourceforge.net; Mon, 16 Mar 2020 15:12:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FAh4+ZsRsbWtICuJgMDzpa3wZ0ySHTOVMGXpJ/bEEEg=; b=JYcLmhVLl6aZeKsDwFIvuBlFfM
 kyHp5v72G2c564e9xT/N/FU6a0KO4uCj4daB79q+8dPSgnE/yEPEfEcT5v3tuJVk+5o8hJ8NU3QIW
 Dce9OPrYowTWnoZVvjsIE9H/5SJ4sIeQevZX26dvvD4HfVuBQ/UjeyP00+nrqCbADO2M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FAh4+ZsRsbWtICuJgMDzpa3wZ0ySHTOVMGXpJ/bEEEg=; b=DcMOU74usgToKy2ZqM1mR4edJt
 1LuGTRtdw8ZtSUKPtRbwMI4eOah+ZMa4q08FmfKr/mRRXxTNJ2DfLtCfAauqp93MHBWN7fXnUPliB
 lkGJUN+/G4kUzzt/N4HBvRj/PmjegGEozHKz7ftEWUuUbKqishAB/baL6eRbWtV/4nCA=;
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jDrQ6-003380-Rl
 for kgdb-bugreport@lists.sourceforge.net; Mon, 16 Mar 2020 15:12:50 +0000
Received: by mail-il1-f194.google.com with SMTP id j69so16826584ila.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 16 Mar 2020 08:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FAh4+ZsRsbWtICuJgMDzpa3wZ0ySHTOVMGXpJ/bEEEg=;
 b=HOh8OHo6JRPnKsknISWiWoXxam2wMiNmGRR6NvyiakbYVwxifIWYmCejVB3MMOjK4a
 8M38Xj1sTNOC2Y4qPpwuVbgnfSHf/rFunliwQ8fzM2CSdhz7RmthIcAeXUBApR98akuP
 kSGv1c3iSq4XZRtYD36sYYz2Ohe99YSJvhIXF2tQL1a8fdtgC12+j40wENiIYQSVHZYM
 kekNhjR/ph995qgVpRygRWUKQELRT7EeBTFjpNHsqVJ6uVPCGdXiNoyyylBhFUqd8A0o
 pXNnfBs02zcST84fApXSJZ5slczDB6UmDi572Xl6Dlds7Dw0c4hWEcyixFEkzdJW+pYu
 68Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FAh4+ZsRsbWtICuJgMDzpa3wZ0ySHTOVMGXpJ/bEEEg=;
 b=kDez0zqNAp7dE5YhfYY9ELMI1LGRGhu75RqlUr47nt6+que6LHUSAqh25DPcAy2avs
 AapIrppPURRsFmx6NtZX2jd1Z2JEAXipG2wDUPy65D1wB+x9w/Rfctx0I2y4tYsnrzyx
 eHMbG+2tpFlvXgZNQZvJvNLTTtfeQmWQQyuv/J7yXIPhkDfvvtUCY2VSXzgxlvABPat+
 u7t478MRJXSR8m+J259BqgkaTXX+bIQgMM7XrqI4VOVumK7kXLfDq/os/4QAK02onIf/
 0QHwdGg2oKMjbach7GGX6N16aatSWjCC2v558qVi8uVL1KhV5CCOBWak1WTCFnCLci3e
 bKeQ==
X-Gm-Message-State: ANhLgQ3MKahQgh8PgPv2aEiPRXAbaTH4CCx+MCnj8tJjX8pfWvd15jRM
 vgfQZMWdmFbXr7fU20SI5tYPKXWKpqKWDQ==
X-Google-Smtp-Source: ADFU+vu2BdclTm/Ckvk1/5m1YDHtMAw0ZoNs/0obu/+OQJVH2x5b3hVPR0yN+rdlnFAUDBtzCxVJ9g==
X-Received: by 2002:a63:2cd:: with SMTP id 196mr220042pgc.188.1584369792534;
 Mon, 16 Mar 2020 07:43:12 -0700 (PDT)
Received: from Mindolluin.aristanetworks.com
 ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id i2sm81524pjs.21.2020.03.16.07.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 07:43:11 -0700 (PDT)
To: linux-kernel@vger.kernel.org
Date: Mon, 16 Mar 2020 14:39:13 +0000
Message-Id: <20200316143916.195608-48-dima@arista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316143916.195608-1-dima@arista.com>
References: <20200316143916.195608-1-dima@arista.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.194 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: windriver.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jDrQ6-003380-Rl
Subject: [Kgdb-bugreport] [PATCHv2 47/50] kdb: Don't play with
 console_loglevel
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
From: Dmitry Safonov via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Dmitry Safonov <dima@arista.com>
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Dmitry Safonov <dima@arista.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Dmitry Safonov <0x7f454c46@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jiri Slaby <jslaby@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Print the stack trace with KERN_EMERG - it should be always visible.

Playing with console_loglevel is a bad idea as there may be more
messages printed than wanted. Also the stack trace might be not printed
at all if printk() was deferred and console_loglevel was raised back
before the trace got flushed.

Unfortunately, after rebasing on commit 2277b492582d ("kdb: Fix stack
crawling on 'running' CPUs that aren't the master"), kdb_show_stack()
uses now kdb_dump_stack_on_cpu(), which for now won't be converted as it
uses dump_stack() instead of show_stack().

Convert for now the branch that uses show_stack() and remove
console_loglevel exercise from that case.

Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Jason Wessel <jason.wessel@windriver.com>
Cc: kgdb-bugreport@lists.sourceforge.net
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 kernel/debug/kdb/kdb_bt.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
index 3de0cc780c16..43f5dcd2b9ac 100644
--- a/kernel/debug/kdb/kdb_bt.c
+++ b/kernel/debug/kdb/kdb_bt.c
@@ -21,17 +21,18 @@
 
 static void kdb_show_stack(struct task_struct *p, void *addr)
 {
-	int old_lvl = console_loglevel;
-
-	console_loglevel = CONSOLE_LOGLEVEL_MOTORMOUTH;
 	kdb_trap_printk++;
 
-	if (!addr && kdb_task_has_cpu(p))
+	if (!addr && kdb_task_has_cpu(p)) {
+		int old_lvl = console_loglevel;
+
+		console_loglevel = CONSOLE_LOGLEVEL_MOTORMOUTH;
 		kdb_dump_stack_on_cpu(kdb_process_cpu(p));
-	else
-		show_stack(p, addr);
+		console_loglevel = old_lvl;
+	} else {
+		show_stack_loglvl(p, addr, KERN_EMERG);
+	}
 
-	console_loglevel = old_lvl;
 	kdb_trap_printk--;
 }
 
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
