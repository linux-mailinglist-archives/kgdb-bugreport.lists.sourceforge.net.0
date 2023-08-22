Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFBE784BD2
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 22 Aug 2023 23:13:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qYYgj-0003lP-JL
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 22 Aug 2023 21:13:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qYYge-0003lG-Rd
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 21:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8CoIShF4nm+Y+TTq/y1T+mYqaAIRb3s+laDow41BW7Y=; b=OxitBlO1w+nqfIBYHs8He0O/Px
 A7sOEzFre1gHuX/cEH6PY4bbWyDVlS9h446W7rcQOebozbJWQEBdm6dMO22XSi9c8MU+4GOqjCKgU
 EEUXB84/hqce4Ail8kvGxLytpfoBIOKf/0brGtqv2nn+biQMm8qglt5xMIX9i9+KR6os=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8CoIShF4nm+Y+TTq/y1T+mYqaAIRb3s+laDow41BW7Y=; b=j
 FILUhJGun9KnE2N4aGM1tBcoD43SOnVFB0MXLePc8z0VOOX4Wp0gI9IC6cPbETPh3rLZJe+qMADrr
 mc9wi/cGRIq1CNyYgf2ntRV44KvPEXzK8SZuolCbwCDG7OfJqTCmfVW2SluC1bPPc4UjyofddVm2M
 t9HwZSc/PwYsPGZ4=;
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qYYgd-0005jI-10 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 21:13:15 +0000
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-3a78a29bca3so3424856b6e.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 22 Aug 2023 14:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692738788; x=1693343588;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8CoIShF4nm+Y+TTq/y1T+mYqaAIRb3s+laDow41BW7Y=;
 b=W/prlYqr8rd+6I8k7KdEwb75daPoohPM6G16q+zqkeJO14nGtHn1Kw5E5A0p7ywzYW
 spZPlo1kbDbgnLAQAiIinba+lHINpGR2b+tw/wLJuY2ctDhW7rHxZm7KhhR+kqtV6b71
 4tHSemnDGelkrTz6ZMzODLPtUQSUPmKpLTAwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692738788; x=1693343588;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8CoIShF4nm+Y+TTq/y1T+mYqaAIRb3s+laDow41BW7Y=;
 b=XnxLozlHCWA5dUpfHZpn+LBa2TuiJ6dIrmpqVPUd24O/BtS517Tfto1ibDucNZkaw1
 jh8fyBoUJth5vAs0utUbXVwko0gIyXmLJaQDsKiD/iB3QOHaBMQ5+h4c2FlJ8Vzcql37
 +u0m3Kj624ISN9zBk4rr9yP8oM2xr29ZVYMNdK3n5Xa6BdyfLRLpgNJaDQCmjtozY4k1
 K3EcPU0fRTmnuYxFPxQ08w7eaB56D5qp320/Q131ZERvlNjbFJwg/D5pwH41QmLIJKGl
 ztnQr5HDl5F1Ita0rnTiptaNy4zXagZZzqhbhY2wxRi8bZyeMqoInENhNaataIXp1N5K
 m1nQ==
X-Gm-Message-State: AOJu0YwdbrpmjRLMZU8dxuBximyusIlehHK+mGO/tutz6YhtjhaRkE1F
 Z2+H28sFkJNUb3N6RQo4VvLYPt9qrkPp8WkfVJtpRb04
X-Google-Smtp-Source: AGHT+IEOd1vneyKiVpEjHFGaH9Q1mMseOqcs4FdujoDsrT8ncCLzzNclMLLcp4LQh6q8MNEdCdwUMA==
X-Received: by 2002:a05:6a20:199:b0:130:9638:36d4 with SMTP id
 25-20020a056a20019900b00130963836d4mr7946558pzy.33.1692735684540; 
 Tue, 22 Aug 2023 13:21:24 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:83f0:2bc5:38c4:a9de])
 by smtp.gmail.com with ESMTPSA id
 w29-20020a63935d000000b00563df2ba23bsm8254729pgm.50.2023.08.22.13.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 13:21:23 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Tue, 22 Aug 2023 13:19:46 -0700
Message-ID: <20230822131945.1.I5b460ae8f954e4c4f628a373d6e74713c06dd26f@changeid>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When entering kdb/kgdb on a kernel panic, it was be observed
 that the console isn't flushed before the `kdb` prompt came up. Specifically, 
 when using the buddy lockup detector on arm64 and running: ec [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.171 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.171 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qYYgd-0005jI-10
Subject: [Kgdb-bugreport] [PATCH] kgdb: Flush console before entering kgdb
 on panic
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
Cc: kgdb-bugreport@lists.sourceforge.net, Petr Mladek <pmladek@suse.com>,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

When entering kdb/kgdb on a kernel panic, it was be observed that the
console isn't flushed before the `kdb` prompt came up. Specifically,
when using the buddy lockup detector on arm64 and running:
  echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT

I could see:
  [   26.161099] lkdtm: Performing direct entry HARDLOCKUP
  [   32.499881] watchdog: Watchdog detected hard LOCKUP on cpu 6
  [   32.552865] Sending NMI from CPU 5 to CPUs 6:
  [   32.557359] NMI backtrace for cpu 6
  ... [backtrace for cpu 6] ...
  [   32.558353] NMI backtrace for cpu 5
  ... [backtrace for cpu 5] ...
  [   32.867471] Sending NMI from CPU 5 to CPUs 0-4,7:
  [   32.872321] NMI backtrace forP cpuANC: Hard LOCKUP

  Entering kdb (current=..., pid 0) on processor 5 due to Keyboard Entry
  [5]kdb>

As you can see, backtraces for the other CPUs start printing and get
interleaved with the kdb PANIC print.

Let's replicate the commands to flush the console in the kdb panic
entry point to avoid this.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/debug_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index d5e9ccde3ab8..3a904d8697c8 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -1006,6 +1006,9 @@ void kgdb_panic(const char *msg)
 	if (panic_timeout)
 		return;
 
+	debug_locks_off();
+	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
+
 	if (dbg_kdb_mode)
 		kdb_printf("PANIC: %s\n", msg);
 
-- 
2.42.0.rc1.204.g551eb34607-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
