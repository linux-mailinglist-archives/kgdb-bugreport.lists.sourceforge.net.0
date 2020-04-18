Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0331AF4F8
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 18 Apr 2020 22:42:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hVp498so9vNfKXfXbG6jjvjOS5O7N0vJrlBul5/QM4s=; b=DNRnDU+bgq1v0fJ4kIViSELow
	Z3SNRxTpCDyI7+wlPRA7jUnSNr4iTW499jJ0nauypNQzT6fRrrnCfhZwDCPUFJYYxTnwJ8ePI0sE/
	r5yWd/g2rTQvzo4RVCutxtbgV0F7V5pmVL+ep4q+E67ZnEkAeAB3zgZ3KoO/9cqjGi4Qk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jPuIK-0004ZV-1Y
	for lists+kgdb-bugreport@lfdr.de; Sat, 18 Apr 2020 20:42:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dima@arista.com>) id 1jPuII-0004ZM-Hs
 for kgdb-bugreport@lists.sourceforge.net; Sat, 18 Apr 2020 20:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UewK9hpbawAl/WYk+ND4T8F/xnhDTg+TNkaDS8X7FAg=; b=JTtI0pBwfhuO2/qb85fVVY68k3
 HdVy8w18xepG53dAxEHsoBAkvHBhsREMpa01AJ3W294n+QQ4eMp6GpIBzgTws3wBzrQ8XdZgHNEgK
 bktUcdbBtpOrBlRJz0AC7qdvF1vbWzJFiOAm/FnCho3MexgY5LfnrOQxKiyZfgCrUOSA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UewK9hpbawAl/WYk+ND4T8F/xnhDTg+TNkaDS8X7FAg=; b=Gr5yxTufJIdy1jl7iQVJPBbz/C
 O/wT/V8l7hQs/5yRjeP5Ydzkc+2O6AgXIehJOU5nbo+4EYsI8xC5f6PFX1v0jS/E3j/IUU4ftoF/B
 o1VYjb5tXBY8ZalcpjmTIHVSdxhIsCTGB0zpXJeUx9Y8AlMNebB6mejmGseIZqnc7rHs=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jPuIG-0033dA-Nw
 for kgdb-bugreport@lists.sourceforge.net; Sat, 18 Apr 2020 20:42:30 +0000
Received: by mail-wm1-f66.google.com with SMTP id x4so6546348wmj.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 18 Apr 2020 13:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UewK9hpbawAl/WYk+ND4T8F/xnhDTg+TNkaDS8X7FAg=;
 b=HIlEqOgj2cmtL9KqmWgeEy0gQuJtaVHQ2cHd9TL6LYzeq+/b7CNH9O2AnMvfqwUwvf
 S0mJeEnt1BlrQs0E0jAyHh3xwJPUVthydthFhyyLPd2/4tMYJ1vbJHerC/BEGfJO2JY5
 4XeD++gDBfQv6KfCOl7yU/+ba1E4AkcJxGseQXm0FxDpKK4eqrQswBW2yHMFYEVgv+nO
 sq/nkqxzhK5qUg+90RWPI5o04/AX1DzPH0WeMv6kvdQBBiy6f4p07p/638a9lOfAGSpI
 hq3vSlwGfXw67qjsKksztz3PNazbwK+d5zaZdxUWpYfXqzcNDenfCUfNvGd95r0VenNR
 +Gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UewK9hpbawAl/WYk+ND4T8F/xnhDTg+TNkaDS8X7FAg=;
 b=eMpM6Nw44RGQ7YWjmmldmq22h+IebMOxLyCRFaCn3U+oxaB6dlRPVcB9xHansgHNo2
 rMkjsDZJX1zCTOD4wZ00ASCxj5bn9j0pQk/fZzAtR8iOHI24W/8llund1LHJM0ywD05t
 iLWMnUmQZVDawR2FLzgH7aY4IYw31EHW0xNPTW5Vi1dBSG0HLc5sKjWcUeiJob+eutUA
 050kzCF1QMvF/GKwAmiuOj4Gj1zPbGm5kuzxKpRYQDbAbetgs8QRihMtng0AeMsujf/O
 0kzX+wAmoqWIHalUSREdC8QDFPMzbGJve4CFrWmhKF5EofvfMPH3XK5kaas4r6hoYBgd
 GpqQ==
X-Gm-Message-State: AGi0PuY3Ktis32KVTN7ucCT5zk8/esMXsVKvWNMxnNJrH7fD7wouzWku
 VWfR01jKDaGh0GgxoJDu82DvF68eovI=
X-Google-Smtp-Source: APiQypKR5Y1qOUmKwsHhnH8t7/xEWQdJ92qlq/z6zpVNikpJ4d3OGf+F5GDVmWR8X/evMGIV0sK2CA==
X-Received: by 2002:a1c:7d90:: with SMTP id
 y138mr10245638wmc.121.1587241254076; 
 Sat, 18 Apr 2020 13:20:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id
 m1sm31735255wro.64.2020.04.18.13.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 13:20:53 -0700 (PDT)
To: linux-kernel@vger.kernel.org
Date: Sat, 18 Apr 2020 21:19:41 +0100
Message-Id: <20200418201944.482088-48-dima@arista.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200418201944.482088-1-dima@arista.com>
References: <20200418201944.482088-1-dima@arista.com>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.8 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jPuIG-0033dA-Nw
Subject: [Kgdb-bugreport] [PATCHv3 47/50] kdb: Don't play with
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
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
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
2.26.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
