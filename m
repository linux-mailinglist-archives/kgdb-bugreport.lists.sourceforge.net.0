Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0511D1DEA6C
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 May 2020 16:55:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jc954-0005yL-R3
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 May 2020 14:55:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jc953-0005xy-DT
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 14:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z2JTvHuqFiAH+e0uHvAv7QUdItZgp1++hBsH29TGAGE=; b=BcbDk2NPapDYzdGmAfFj6nkANi
 fIdBBDFa+oXV2VLSF198RUSM9flu5DxKqQwXtWNPaviRyjRAX1jG/Fvuvw1ystFpSbPu20+NC/bzZ
 dAIvv0byZVf45L8TJK35ynkoR+vKFKy490fsBP0bCzVjSJliEVbHs7Rx5HBVi2LYY5KQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z2JTvHuqFiAH+e0uHvAv7QUdItZgp1++hBsH29TGAGE=; b=F9okVhJolApX7u1IehMaVBgtHg
 qXWvuVzdnPwBtGJF8/jZjSR5s69Y0cdRJlc9oBCMx1wotdBLQ45mFsS6UoJi14t/HCiQA54OPgFNi
 7/cZ+TtBBSzDCcvw3M3kgIpAphgbquycawReKmr/+2x4XziMAleVSRMo3WH9YhFUNGPI=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jc950-00CzpX-5T
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 14:55:25 +0000
Received: by mail-wr1-f66.google.com with SMTP id l17so10467465wrr.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 May 2020 07:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z2JTvHuqFiAH+e0uHvAv7QUdItZgp1++hBsH29TGAGE=;
 b=RH3hJubUWGtSNW24GhTx6ufaJ6TRraOrbbB6edaZ1SxjVy3F3fER9ye7M9DV2/koq2
 WolLZoTDKPlKaRDouJvsUsCVShp5GvsPjxVf/vBlD/kFDBl2QP/5obzIUP+C/DliXKFe
 vWBbx3oaBCHHqGyG00lPrlsfgZua0ucfU7gneN0OBBm88TXXdm3WRzT32ng9qk+9ZzFh
 UvzEk05phTl5Vurl2f8gX/swSGoyVuEc8AtTZnZIAfWIo53XvjMUP16u91mtv7nQ5Dsd
 C/dtaKrFdXg8UuWpnXiR/uEA3LADGd0mTIdfzp1TkIHIRHLFSVWLPTxxG9wU5PP1z82f
 I9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z2JTvHuqFiAH+e0uHvAv7QUdItZgp1++hBsH29TGAGE=;
 b=ubgzdxcUZO1LHooM7+8fWLTyn9br/aovUixgT07CaGDh2IBgeq4mxAl5R5El1EM4CS
 3W9UOrQBJ2vXrmB3jFgUgzrKNihNSILWtD04bkdj+BE0DCWFOIp5FFVSUHMY52aF3ndE
 xtO7A2wpjp/E7vwQ4ba8geVWbRQjBwNdx7ZqvZNN0oTOdIChENQZt+L4xjT72g/rNYtO
 7+f44gZMmhQNu820D9FG1CGXPldQL6yHJmQYBOw76jwDz6oWHwYrUJdr9T49YqKgqJVb
 zVoq4GGGFLYDwZ+t0Y0uUn/MXA/uMyXhhHX2G0HnNCJMgmZvKVaQSOe08qNz9E2u4DGZ
 LvJA==
X-Gm-Message-State: AOAM531LfxJG2L5fjWWWcnOCVfq/0jBmmSkCZj+jsLMuCSZD0F/b0Wma
 zpkByq+XwiOWRPbetK9dv3Psww==
X-Google-Smtp-Source: ABdhPJzVBNmBWWvQ9nOtr1g+uNGIt9/otWbCh5kkWpEi6Kn9nuax/sD2PRXbA3VTqgPQqIPvlzBrKA==
X-Received: by 2002:adf:eb08:: with SMTP id s8mr3721175wrn.361.1590159315732; 
 Fri, 22 May 2020 07:55:15 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id i21sm9746911wml.5.2020.05.22.07.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 07:55:15 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: sumit.garg@linaro.org, jason.wessel@windriver.com, dianders@chromium.org
Date: Fri, 22 May 2020 15:55:09 +0100
Message-Id: <20200522145510.2109799-2-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200522145510.2109799-1-daniel.thompson@linaro.org>
References: <20200522145510.2109799-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jc950-00CzpX-5T
Subject: [Kgdb-bugreport] [RFC PATCH 1/2] debug: Convert dbg_slave_lock to
 an atomic
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
Cc: pmladek@suse.com, Daniel Thompson <daniel.thompson@linaro.org>,
 patches@linaro.org, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 sergey.senozhatsky@gmail.com, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently the debug core takes and releases dbg_slave_lock, knowing it to
be uncontended, as a means to set and clear a flag that it uses to herd
the other cores in to or out of a holding pen.

Let's convert this to a regular atomic instead. This change is worthwhile
simply for the subtle increase in clarity in a very tangled bit of code.
It is also useful because it removes a raw_spin_lock() from within the
debug trap, which will make it easier to introduce spin lock debugging
code for the debug trap handler.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/debug_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 2b7c9b67931d..8f43171ddeac 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -121,12 +121,12 @@ static struct kgdb_bkpt		kgdb_break[KGDB_MAX_BREAKPOINTS] = {
 atomic_t			kgdb_active = ATOMIC_INIT(-1);
 EXPORT_SYMBOL_GPL(kgdb_active);
 static DEFINE_RAW_SPINLOCK(dbg_master_lock);
-static DEFINE_RAW_SPINLOCK(dbg_slave_lock);
 
 /*
  * We use NR_CPUs not PERCPU, in case kgdb is used to debug early
  * bootup code (which might not have percpu set up yet):
  */
+static atomic_t			slaves_must_spin;
 static atomic_t			masters_in_kgdb;
 static atomic_t			slaves_in_kgdb;
 static atomic_t			kgdb_break_tasklet_var;
@@ -615,7 +615,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 			dump_stack();
 			kgdb_info[cpu].exception_state &= ~DCPU_WANT_BT;
 		} else if (kgdb_info[cpu].exception_state & DCPU_IS_SLAVE) {
-			if (!raw_spin_is_locked(&dbg_slave_lock))
+			if (!atomic_read(&slaves_must_spin))
 				goto return_normal;
 		} else {
 return_normal:
@@ -677,7 +677,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 	 * CPU in a spin state while the debugger is active
 	 */
 	if (!kgdb_single_step)
-		raw_spin_lock(&dbg_slave_lock);
+		atomic_set(&slaves_must_spin, 1);
 
 #ifdef CONFIG_SMP
 	/* If send_ready set, slaves are already waiting */
@@ -741,7 +741,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 		dbg_io_ops->post_exception();
 
 	if (!kgdb_single_step) {
-		raw_spin_unlock(&dbg_slave_lock);
+		atomic_set(&slaves_must_spin, 0);
 		/* Wait till all the CPUs have quit from the debugger. */
 		while (kgdb_do_roundup && atomic_read(&slaves_in_kgdb))
 			cpu_relax();
-- 
2.25.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
