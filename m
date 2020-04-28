Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 509FC1BCE89
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Apr 2020 23:21:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jTXfm-0003RT-49
	for lists+kgdb-bugreport@lfdr.de; Tue, 28 Apr 2020 21:21:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jTXfk-0003RL-7C
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=krkKzlTv0evl7XtOBkWytpIaTxy+LxvUFfaqcuSVgrw=; b=RlI2JYx6He2L0+OMPbUfYREXXJ
 yzRXjH3ED9XDAROGteB2+HTTPN5VI3Fq1kTVUz8Bifui+ZEKGoc6M+TZF/ENDkmtIAEc52Cz3bAH+
 dewVsrfGWzQCwWSDJZQrAbKfZ0wkv5/kIu+CQFW21UfYjM0KMXoG63Y1lpAZT/0R1lTU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=krkKzlTv0evl7XtOBkWytpIaTxy+LxvUFfaqcuSVgrw=; b=DTb+RqPbr/CCY4sahHu5kMOkTv
 K8uI5SYywMQHb+WwuE9SDRhWXggMkslXhU/yIDVGWgeT3Q3dojTKs5Pel0bnj+2YjQBB7O7i0EH68
 VI2/RT9QicOEElc+04m62JJyk3PPlhBbiRPDYjL0qoFEmMucSF6koOOn+Tttbccg0B6c=;
Received: from mail-pj1-f66.google.com ([209.85.216.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTXfg-00FVAr-RV
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:21:44 +0000
Received: by mail-pj1-f66.google.com with SMTP id a31so66545pje.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 Apr 2020 14:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=krkKzlTv0evl7XtOBkWytpIaTxy+LxvUFfaqcuSVgrw=;
 b=jBJu27+X8D4yb2SJa0NENEq+yawHvCLl+udLKszJlfSZ5PVvIKoPqAvpvqME6MW9Mj
 qtD10jrVnoJisHmxdd2orvAtNEb08FdDeHufUZ6AIp0gEc/tKDo9VwzsZGvXCXUpkg1M
 G5IqiMT138ZbVoT57BPyqAsumzgYR5TeUCKng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=krkKzlTv0evl7XtOBkWytpIaTxy+LxvUFfaqcuSVgrw=;
 b=O7mqRXMw0tsawqQDuOSiVHPxHpQRXv18vQI3Yr+G5rRPh2yBoTPNIgxCMRRGaCS4A6
 Amrg43H8V/dTETWnUSDUsHHM46AjU9knIndCPz9P/bG37lcwbU3RvDlBbFHy5kH2C4Jk
 6s5nzclk4y8LN9qG3uJ/dAlQClsZ004/FTKAIh/UhrnA/pM/tALPyv0i0DbkoNN2jR+H
 5vevlGcWFUSu/58Aw2FflZQtNlE9Jaij0ee3f3cHtJZSFjPlU5Hz39mgd0jz/i9GeHKX
 JVs2bbn9IKb3RYRyqdaywGIzBEvyYDsAPifCEyWdOWKh18MCFAiKmfiJyj5Exm7OpDby
 h3wg==
X-Gm-Message-State: AGi0Pubsxtz9UOerHSYEOehj+QRBTli1DnHYlxBSNeCiSdfZGiXo3P9n
 IbFJiZ+mHk54l49q6LmVto/318oCrzhdOw==
X-Google-Smtp-Source: APiQypJr4LN15nTjffPKEvXDknvrivQ2C51b5dr29r1bWEMRSzhey9PsKy/AkanMbmobrgXqkvk/qQ==
X-Received: by 2002:a17:902:8f90:: with SMTP id
 z16mr14622246plo.216.1588108459461; 
 Tue, 28 Apr 2020 14:14:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id 18sm2988202pjf.30.2020.04.28.14.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 14:14:19 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Tue, 28 Apr 2020 14:13:41 -0700
Message-Id: <20200428141218.v3.1.Ied2b058357152ebcc8bf68edd6f20a11d98d7d4e@changeid>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
In-Reply-To: <20200428211351.85055-1-dianders@chromium.org>
References: <20200428211351.85055-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jTXfg-00FVAr-RV
Subject: [Kgdb-bugreport] [PATCH v3 01/11] kgdb: Disable
 WARN_CONSOLE_UNLOCKED for all kgdb
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
Cc: corbet@lwn.net, kgdb-bugreport@lists.sourceforge.net, hpa@zytor.com,
 bjorn.andersson@linaro.org, agross@kernel.org, bp@alien8.de,
 linux-serial@vger.kernel.org, catalin.marinas@arm.com, jslaby@suse.com,
 tglx@linutronix.de, will@kernel.org, mingo@redhat.com,
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
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---

Changes in v3: None
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
2.26.2.303.gf8c07b1a785-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
