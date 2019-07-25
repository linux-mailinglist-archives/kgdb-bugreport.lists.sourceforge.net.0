Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 457AE7577F
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 25 Jul 2019 21:01:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hqizy-0008Ig-1X
	for lists+kgdb-bugreport@lfdr.de; Thu, 25 Jul 2019 19:01:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1hqizx-0008IY-5E
 for kgdb-bugreport@lists.sourceforge.net; Thu, 25 Jul 2019 19:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=npxna6+n+4ONaMcGcCGKLmZp/6GRMXWyfhc+QLsiEVw=; b=b+yFpxjzgpzZbqUwgw+9MKxZ5Y
 IPT59l+fpTqTho6JzhDao3NLwpsOoyT3LzSk9nSsPNXYss2Y7HNQEzYpqgb0Nm+TC1RP5Tg53qEfS
 bnhwEkOCN5K5gU++KKynL4ipyP8y5yudVykK8H6qMeaSdfia7ulbXOrmeMQKNghJw0ZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=npxna6+n+4ONaMcGcCGKLmZp/6GRMXWyfhc+QLsiEVw=; b=k
 06QPESkadD2f204bCgnoGV9rH0Fx54U7tuEl0i+vEqGoQuB3C2e9Lb9Vyrpj7Z85vtLjHgmyCU3oA
 gJUHPdQSwh3uNJbo3NiDGSjzU/0ZV6/9hxm9g7CfOc3kj7+5Pw3l7asM9yC/rLzWtOSrSXfya0KXL
 dZKHqXkaMYpsKAyg=;
Received: from mail-pl1-f195.google.com ([209.85.214.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hqizv-00G43r-10
 for kgdb-bugreport@lists.sourceforge.net; Thu, 25 Jul 2019 19:01:52 +0000
Received: by mail-pl1-f195.google.com with SMTP id c14so23693772plo.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 25 Jul 2019 12:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=npxna6+n+4ONaMcGcCGKLmZp/6GRMXWyfhc+QLsiEVw=;
 b=Q/XoOpyXq46zTo5ehcCTQ0NqiAPD05+1WN7Ekt3ELa8yoSSDktWSfi5vLOX6UKFj4d
 Hv2rrV1BKlNMnv0dvTfZae3PwzcH4Vd+wij3CQ8z8hdzn8rZDpoLMu+HiYoPKY41lu3U
 Y2HPP/F+5Kfa4x1tqhZhfbcjX6AhxnP8ywR8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=npxna6+n+4ONaMcGcCGKLmZp/6GRMXWyfhc+QLsiEVw=;
 b=SgZ/jebgoUQQem2vNxWUklXjvHxToXpD2h44flZOfL4DNWALqyMgW3xGB0CusO+Xty
 fqISgAk608dizDmEQSLo9vOvqvYX1naG39xyuRnkjCjzm1WF+Uob0wGv3KAnXc0V20qw
 WIbSHVRzlmHww0i/Tq7pF4T1/nSwJBh7bRvYnsTsmrUGHFkNP0ZQdWrhBKju/TJzsihQ
 p+yUCAvt/g3KTaVhRVIPmtkHuzpgtBs/5NkBx4NvvER8ZJ3m8rw2/xeTskac7/MrYBx9
 9kE3Xs2IB2MbXGJmUpy4na9HysoyY4iI7mumXkiOrP4MG/DFfZHA8AdGJZUBRIXegIUL
 70mw==
X-Gm-Message-State: APjAAAX1J/oDEIM///USVWSix0Q50+6q+j+uH1EAqX6EGmfY9ygAK33F
 +wW4n4jWIUzY7AhIHowDVVzEYQ==
X-Google-Smtp-Source: APXvYqzcg6tbTZXUi/ksxaA2L3t2OfQeJvaYoa8UKfYplKmCwDz4Z4M5u5LmMv5+PdG1eLWIRRO7rA==
X-Received: by 2002:a17:902:1566:: with SMTP id
 b35mr94613083plh.147.1564079891325; 
 Thu, 25 Jul 2019 11:38:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id l26sm47484684pgb.90.2019.07.25.11.38.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 11:38:10 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Thu, 25 Jul 2019 11:35:51 -0700
Message-Id: <20190725183551.169208-1-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hqizv-00G43r-10
Subject: [Kgdb-bugreport] [PATCH] kgdboc: disable the console lock when in
 kgdb
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

After commit ddde3c18b700 ("vt: More locking checks") kdb / kgdb has
become useless because my console is filled with spews of:

WARNING: CPU: 0 PID: 0 at .../drivers/tty/vt/vt.c:3846 con_is_visible+0x50/0x74
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.3.0-rc1+ #48
Hardware name: Rockchip (Device Tree)
Backtrace:
[<c020ce9c>] (dump_backtrace) from [<c020d188>] (show_stack+0x20/0x24)
[<c020d168>] (show_stack) from [<c0a8fc14>] (dump_stack+0xb0/0xd0)
[<c0a8fb64>] (dump_stack) from [<c0232c58>] (__warn+0xec/0x11c)
[<c0232b6c>] (__warn) from [<c0232dc4>] (warn_slowpath_null+0x4c/0x58)
[<c0232d78>] (warn_slowpath_null) from [<c06338a0>] (con_is_visible+0x50/0x74)
[<c0633850>] (con_is_visible) from [<c0634078>] (con_scroll+0x108/0x1ac)
[<c0633f70>] (con_scroll) from [<c0634160>] (lf+0x44/0x88)
[<c063411c>] (lf) from [<c06363ec>] (vt_console_print+0x1a4/0x2bc)
[<c0636248>] (vt_console_print) from [<c02f628c>] (vkdb_printf+0x420/0x8a4)
[<c02f5e6c>] (vkdb_printf) from [<c02f6754>] (kdb_printf+0x44/0x60)
[<c02f6714>] (kdb_printf) from [<c02fa6f4>] (kdb_main_loop+0xf4/0x6e0)
[<c02fa600>] (kdb_main_loop) from [<c02fd5f0>] (kdb_stub+0x268/0x398)
[<c02fd388>] (kdb_stub) from [<c02f3ba0>] (kgdb_cpu_enter+0x1f8/0x674)
[<c02f39a8>] (kgdb_cpu_enter) from [<c02f4330>] (kgdb_handle_exception+0x1c4/0x1fc)
[<c02f416c>] (kgdb_handle_exception) from [<c0210fe0>] (kgdb_compiled_brk_fn+0x30/0x3c)
[<c0210fb0>] (kgdb_compiled_brk_fn) from [<c020d7ac>] (do_undefinstr+0x180/0x1a0)
[<c020d62c>] (do_undefinstr) from [<c0201b44>] (__und_svc_finish+0x0/0x3c)
...
[<c02f3224>] (kgdb_breakpoint) from [<c02f3310>] (sysrq_handle_dbg+0x58/0x6c)
[<c02f32b8>] (sysrq_handle_dbg) from [<c062abf0>] (__handle_sysrq+0xac/0x154)

Let's disable this warning when we're in kgdb to avoid the spew.  The
whole system is stopped when we're in kgdb so we can't exactly wait
for someone else to drop the lock.  Presumably the best we can do is
to disable the warning and hope for the best.

Fixes: ddde3c18b700 ("vt: More locking checks")
Cc: Daniel Vetter <daniel.vetter@intel.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/kgdboc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index bfe5e9e034ec..c7d51b51898f 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -277,10 +277,14 @@ static void kgdboc_pre_exp_handler(void)
 	/* Increment the module count when the debugger is active */
 	if (!kgdb_connected)
 		try_module_get(THIS_MODULE);
+
+	atomic_inc(&ignore_console_lock_warning);
 }
 
 static void kgdboc_post_exp_handler(void)
 {
+	atomic_dec(&ignore_console_lock_warning);
+
 	/* decrement the module count when the debugger detaches */
 	if (!kgdb_connected)
 		module_put(THIS_MODULE);
-- 
2.22.0.709.g102302147b-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
