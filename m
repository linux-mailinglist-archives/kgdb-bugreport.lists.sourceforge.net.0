Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 001451B31D4
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Apr 2020 23:22:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jR0LU-0008QZ-Qk
	for lists+kgdb-bugreport@lfdr.de; Tue, 21 Apr 2020 21:22:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jR0LT-0008QM-LG
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Apr 2020 21:22:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0FYzutaOWwkobDVvluYcuHm9VXwfDfu/lChsJmXCxj8=; b=nKfNglcUzanCXAv2/vBydVwN0p
 JPJuEjIURBvZNEmsWZqjBoFZkB9YP/UgcDUtbw0Ckfo5ZhgKUHXZCUp6xvtEnaHHRmr+EUlfYzaHI
 Y96IjV+qtui2KqCiMdGuTCh99jQ618bQ7D+iWJLHp6/WGKhcRUmazAQVdmyliKropxOM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0FYzutaOWwkobDVvluYcuHm9VXwfDfu/lChsJmXCxj8=; b=dasF8DvEeMBtzN0+187tMEDUHo
 o85nQO4kgNlNBsCBeIgrUezv9srBr2IvTkWxXB8yZYHQzx9EJno6NEmkhgCqCyLxXcZ5LhuntUlMN
 7qw8n8oNyivIFqd3tGSu5gjqAjuQZnuBq3KgMh7wDm7A/XSfGp+mTW9Ah518ZELSofz8=;
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jR0LS-008sim-9h
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Apr 2020 21:22:19 +0000
Received: by mail-vs1-f68.google.com with SMTP id h30so195116vsr.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 21 Apr 2020 14:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0FYzutaOWwkobDVvluYcuHm9VXwfDfu/lChsJmXCxj8=;
 b=RrGLy4OKZdZcG8ieGRjfJ4zZHn+LjWtKJ9z8GfIKxz2r/6HXOuTE6X4vBBofmQTFV1
 3J1MxMDzRXSUJte11GSbUy++0LWNKDT8dA3sg3TK1qcBNj1PjcyX+hM6avDkOQXZfxF9
 eC4B2EXg5l4CTwe2mz0DPy6bBEaOsUySU0TR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0FYzutaOWwkobDVvluYcuHm9VXwfDfu/lChsJmXCxj8=;
 b=LwjFRSSv6QtFkx13TSYiENSirdu4nPEwbU3OEHjqgR1arwZyDqvEZvpvVqQYbR8gC0
 sDR7jsKegz/Tk5W1D6/4Ug+y/hJvuceoRxp1CUad7P6jTWgWIMYqLHJliXulKS+onDWr
 eO0B7XVG9ZVvNd7qBldZRK/zJKX+z+kl0Iq/u1Ps2Fpze1wYrTTQxCZiSWQ4gu7XP0j8
 Ii1OFKC08pB80KH8h6ysqLKA/+JYc94CfoSdyZQN33Yjj6q0m+LD3qHK0stThyFmrPRv
 qzOH55iC19DQukv16oAbO5dKf8hwhyglSuBKnrw+UsNXo2uSPCGOANCqy8gjDTy+mFOO
 uCXA==
X-Gm-Message-State: AGi0PuapKB0BStfoDJSNJE98vHWOK2TY8NPsy3i7NyMm9F3JY/V17xZB
 nzV/nmlZrUBPYDDAM2iiAGOnr4qCldO+3g==
X-Google-Smtp-Source: APiQypIj7iK+ENNSKb4XQE4AkZpuuv1vhCL8EgK3cFai/GvUv4iH3IENUvbKD1Nzenb8tsIv34YzcQ==
X-Received: by 2002:a17:902:bcc4:: with SMTP id
 o4mr208635pls.233.1587503719408; 
 Tue, 21 Apr 2020 14:15:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id c1sm3287880pfo.152.2020.04.21.14.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 14:15:18 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Tue, 21 Apr 2020 14:14:39 -0700
Message-Id: <20200421141234.v2.1.Ied2b058357152ebcc8bf68edd6f20a11d98d7d4e@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421211447.193860-1-dianders@chromium.org>
References: <20200421211447.193860-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jR0LS-008sim-9h
Subject: [Kgdb-bugreport] [PATCH v2 1/9] kgdb: Disable WARN_CONSOLE_UNLOCKED
 for all kgdb
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
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 kgdb-bugreport@lists.sourceforge.net, jslaby@suse.com, agross@kernel.org,
 bjorn.andersson@linaro.org, mingo@redhat.com, bp@alien8.de,
 linux-serial@vger.kernel.org, hpa@zytor.com, tglx@linutronix.de,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

In commit 81eaadcae81b ("kgdboc: disable the console lock when in
kgdb") we avoided the WARN_CONSOLE_UNLOCKED() yell when we were in
kgdboc.  That still works fine, but it turns out that we get a similar
yell when using other I/O drivers.  One example is the "I/O driver"
for the kgdb test suite (kgdbts).  When I enabled that I again got the
same yells.

Even though "kgdbts" doesn't actually interact with the user over the
console, using it still causes kgdb to print to the consoles.  That
trips the same warning:
  con_is_visible+0x60/0x68
  con_scroll+0x110/0x1b8
  lf+0x4c/0xc8
  vt_console_print+0x1b8/0x348
  vkdb_printf+0x320/0x89c
  kdb_printf+0x68/0x90
  kdb_main_loop+0x190/0x860
  kdb_stub+0x2cc/0x3ec
  kgdb_cpu_enter+0x268/0x744
  kgdb_handle_exception+0x1a4/0x200
  kgdb_compiled_brk_fn+0x34/0x44
  brk_handler+0x7c/0xb8
  do_debug_exception+0x1b4/0x228

Let's increment/decrement the "ignore_console_lock_warning" variable
all the time when we enter the debugger.

This will allow us to later revert commit 81eaadcae81b ("kgdboc:
disable the console lock when in kgdb").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("kgdb: Disable WARN_CONSOLE_UNLOCKED for all kgdb") new for v2.

 kernel/debug/debug_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 2b7c9b67931d..950dc667c823 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -668,6 +668,8 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 	if (kgdb_skipexception(ks->ex_vector, ks->linux_regs))
 		goto kgdb_restore;
 
+	atomic_inc(&ignore_console_lock_warning);
+
 	/* Call the I/O driver's pre_exception routine */
 	if (dbg_io_ops->pre_exception)
 		dbg_io_ops->pre_exception();
@@ -740,6 +742,8 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 	if (dbg_io_ops->post_exception)
 		dbg_io_ops->post_exception();
 
+	atomic_dec(&ignore_console_lock_warning);
+
 	if (!kgdb_single_step) {
 		raw_spin_unlock(&dbg_slave_lock);
 		/* Wait till all the CPUs have quit from the debugger. */
-- 
2.26.1.301.g55bc3eb7cb9-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
