Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A40E8F1236
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  6 Nov 2019 10:32:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1YA261jFIQWkwdY0UQGAxJXS3n63eLE8Sk63SJmbpFc=; b=ASI/W3iA51bB05TXjgQly5Fxy
	65+dIxmsd90RyHN+2sZn35k7HEVhZr8H2tvvOLe/TqZKzHh1/DQ6AEZut7DyKAnJnEXXeQhei8Cwt
	uU5utFDc/hPRijDnKohXnf7zaK+rfG8cJC7m06Ad2qb/xL6djfzVe5gG1n5xD+/U+Ilhg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iSHfe-00074B-GK
	for lists+kgdb-bugreport@lfdr.de; Wed, 06 Nov 2019 09:32:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dima@arista.com>) id 1iSC4I-0003j9-UI
 for kgdb-bugreport@lists.sourceforge.net; Wed, 06 Nov 2019 03:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NQVs5wwFF+ZXBQRWhQmdDS/dpWCW86lqTZTcB1oCVCs=; b=OAAqkJ0vRxPDYxibiZrUq8uqhP
 POe9Q5Dc/qrDyC9Re2u4Gzwj+RGzxQ9Cr1FAqXkXjF1nr3gq3kSCEN6TUsFg0cCIqWRQtPnTD8qAL
 nrag25iSfO5hrpOG46WUBFXDPbmwUem/OBYY7/j/0jhJDPFsDv61eTmMjIqpeHdUzJrU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NQVs5wwFF+ZXBQRWhQmdDS/dpWCW86lqTZTcB1oCVCs=; b=YTYu/Mr4BZGc6eOk37/j5mDMc9
 JhuMEeW5eWTYrOsZot9MfMQ40RO5hzmPD2ZM28798ZMkGSPaEXiEBW+7V/gP1s9D5Z4Kr3x+3TLPu
 9CxHaucfyQez3TtL5dIpqIrv1fSu5lbkcwP49jTaL5tQ1cOj1JBdYof+vuxZzT4QS+cI=;
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iSC4H-002HKP-Ix
 for kgdb-bugreport@lists.sourceforge.net; Wed, 06 Nov 2019 03:33:14 +0000
Received: by mail-io1-f67.google.com with SMTP id q83so4160552iod.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 05 Nov 2019 19:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NQVs5wwFF+ZXBQRWhQmdDS/dpWCW86lqTZTcB1oCVCs=;
 b=hwEVVRAjUSZdGmd+zIYiiAm0BS6vQRqT7Np8QLCJa9rwgas6NUYjnhfkxHtysM2NyL
 3gqqp68+OE4P2hnz0GpO+I46aH+QG3hAxxxcnelkgX2r/YMrlvKrsawetAKp9JCiRRqE
 OAGyhs55+Hnz0vlSMDamrklsOrmY5Pcm97Z91Y30EhluCasiFBZpNilghWULDcjczBqO
 mygnTgXwjiCXE0sqnj6Jz/SU6uHZH3yEKabR4lbld4B0wynD8fnk4lR02tSLVmIhdYu8
 XJ/GpU/rAbDRkgoh8bFh0hg7qQaCVAbssY8fkgRhfF7uJO84arARAzE72rim2JzgLg06
 wXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NQVs5wwFF+ZXBQRWhQmdDS/dpWCW86lqTZTcB1oCVCs=;
 b=kg9Ks7K5Oj/yFq5bo6gRGnI/7mVXYjvaTJZFunZ7AlsOx5wmUDwHiX5xQf9b0Ap7QB
 vTMPFULfn1w6aCp5yWx0RjJmXG6CTa+28NziTkbbWeMUQu1BAYcug3jjljpPa5ZbS4P7
 QtTC5mxduDgN/ca5ZAvaxeLUhWhtsTGt8ZdrJihrF+Kk5aURueCanz7bT+SjVh+cxHvI
 /pILhFuP8ct3E5OH93qAk2ynCctIubrgk0lYTFq4YS+nS7IOKbd0vH4iG3od6Cza8hDB
 Vo7K28aHgIUgX9dg+Ub871FOOUV83RlN4b+InBoWRQHSNwKCoORBhmyOx3c3wOP8Mnej
 JXzA==
X-Gm-Message-State: APjAAAUQTOpIMHLUaeM5mAaItR0SPKlPc19HuzvcQb3BZylMpNSHRmO2
 PLrlrL8pRjYbClNKgOwzmByv5KTfuvY=
X-Google-Smtp-Source: APXvYqzO/MiX6rzUz7ULsfgX2r4ZuEI8e6SlpcEQ3E12/qqbszPZo0vGvcYI2lG10DGwQ7pYN8yQaA==
X-Received: by 2002:a63:c405:: with SMTP id h5mr240542pgd.60.1573009745814;
 Tue, 05 Nov 2019 19:09:05 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id k24sm19570487pgl.6.2019.11.05.19.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 19:09:05 -0800 (PST)
To: linux-kernel@vger.kernel.org
Date: Wed,  6 Nov 2019 03:05:38 +0000
Message-Id: <20191106030542.868541-48-dima@arista.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106030542.868541-1-dima@arista.com>
References: <20191106030542.868541-1-dima@arista.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iSC4H-002HKP-Ix
X-Mailman-Approved-At: Wed, 06 Nov 2019 09:32:08 +0000
Subject: [Kgdb-bugreport] [PATCH 47/50] kdb: Don't play with console_loglevel
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

Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Jason Wessel <jason.wessel@windriver.com>
Cc: kgdb-bugreport@lists.sourceforge.net
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 kernel/debug/kdb/kdb_bt.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
index 7e2379aa0a1e..5ce1fe082a38 100644
--- a/kernel/debug/kdb/kdb_bt.c
+++ b/kernel/debug/kdb/kdb_bt.c
@@ -21,22 +21,19 @@
 
 static void kdb_show_stack(struct task_struct *p, void *addr)
 {
-	int old_lvl = console_loglevel;
-	console_loglevel = CONSOLE_LOGLEVEL_MOTORMOUTH;
 	kdb_trap_printk++;
 	kdb_set_current_task(p);
 	if (addr) {
-		show_stack((struct task_struct *)p, addr);
+		show_stack_loglvl(p, addr, KERN_EMERG);
 	} else if (kdb_current_regs) {
 #ifdef CONFIG_X86
-		show_stack(p, &kdb_current_regs->sp);
+		show_stack_loglvl(p, &kdb_current_regs->sp, KERN_EMERG);
 #else
-		show_stack(p, NULL);
+		show_stack_loglvl(p, NULL, KERN_EMERG);
 #endif
 	} else {
-		show_stack(p, NULL);
+		show_stack_loglvl(p, NULL, KERN_EMERG);
 	}
-	console_loglevel = old_lvl;
 	kdb_trap_printk--;
 }
 
-- 
2.23.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
