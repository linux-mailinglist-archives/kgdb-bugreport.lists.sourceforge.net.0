Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6F570A94B
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 20 May 2023 18:54:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q0PqY-0006js-G8
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 20 May 2023 16:54:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q03mq-0003nc-0U
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UnFfGU/I4XqnD3vR2plxo+ON4CdNtjzdhInwWKp0AYA=; b=UX+KIflK0SygocsrT4BVMtJwk0
 W/3+E3fMGDpiKAxC37/RcGZ0hntlXWWW/LsaCs8WFCP4ig7W3dn9Cpt51Y8OUpljJudTcrVakaB53
 pdNmG06vgo41D+Q11a45RE+lX6GbAMvdwb3LaBSLk566eL4l2vLLXy7G2OhR6WUNosC0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UnFfGU/I4XqnD3vR2plxo+ON4CdNtjzdhInwWKp0AYA=; b=hAokgtSAAtR83Xoy7SNxGGIcr5
 jTIvIayBQ7LpHHnoUKpYelqAanbArUFBJRCPrRbQLMPquoWfuRprFQ0CCnKtmq9pfj/0+A6+axA9u
 l0wtsbhzRaT0kliBqYVgbnLemPn5LLjSLE5WNfFXhZe0VjJRPBKQ7SqB6CVpHA1/rE3c=;
Received: from mail-pg1-f178.google.com ([209.85.215.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q03mq-00DXsr-6D for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:21:04 +0000
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-5346d150972so2093475a12.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684516858; x=1687108858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UnFfGU/I4XqnD3vR2plxo+ON4CdNtjzdhInwWKp0AYA=;
 b=lxH/4MUC2qjFAGmxlIf7xL66pYKuvfuFHFniVj+sFei0k520ZoJVIsJ2TuQTYRFKmU
 Kv7RzI/+zr61ZR632FK90CsTulb8O6mzHcizjQlqqXpquiqqpjeZ06rYt7ixiRLOzaPI
 g9JXyU6LG/ka08BvJnteCTM4hKwIRgOw+mRuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684516858; x=1687108858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UnFfGU/I4XqnD3vR2plxo+ON4CdNtjzdhInwWKp0AYA=;
 b=YF+fdnJQPs9/jHPMOLixR36KIS1hR2a1C3B1JTNcdV870NrfVMFZdj4+PrDoJBBlTC
 H3+0I3IYMOwyEpFd0TAUtT4tCDtDsmJUU5BkOYIritgru/eAFHWKVmRhNb4HwcSt5w9U
 6Rp8QaaNEGQOjDOtP0cG742H731QJYtozSYBu8vYGjpNe93eIGYLWBqG82dx2DWGstzA
 bINoAyXrkh8uzatkWE0G4SYkCpcdDm8IVJIgSYa7HsUhfXJ8PHGXA9SElnkbK2NAzHvJ
 Z1zc9+CdXyQDOAVNuBnzXPNiwIgD6GrdSQL3mSBk0VsQiPamKPP+ali5Gg/JxwJKlEBc
 u+8g==
X-Gm-Message-State: AC+VfDx/Wbk6+WcYrpf4YOscVqNUNH730U3szDZVYHVoc8Td+TwAX38B
 Y3poXp/02EfETHb2nhEqi5hbdQ==
X-Google-Smtp-Source: ACHHUZ6fm8nmFPR/13lOFlRmyTFHqJAlM+nr9rZSbMpGPC09DnlecDv3KY2MaywK0HIZmVs5jnrdNw==
X-Received: by 2002:a17:90a:2a42:b0:252:e7db:66df with SMTP id
 d2-20020a17090a2a4200b00252e7db66dfmr2384233pjg.49.1684516858651; 
 Fri, 19 May 2023 10:20:58 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9b89:2dd0:d160:429d])
 by smtp.gmail.com with ESMTPSA id
 gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:20:57 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 19 May 2023 10:18:31 -0700
Message-ID: <20230519101840.v5.7.Ice803cb078d0e15fb2cbf49132f096ee2bd4199d@changeid>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The code currently in "watchdog_hld.c" is for detecting
 hardlockups
 using perf, as evidenced by the line in the Makefile that only compiles this
 file if CONFIG_HARDLOCKUP_DETECTOR_PERF is defined. Ren [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.178 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.178 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q03mq-00DXsr-6D
Subject: [Kgdb-bugreport] [PATCH v5 07/18] watchdog/perf: Rename
 watchdog_hld.c to watchdog_perf.c
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, christophe.leroy@csgroup.eu,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The code currently in "watchdog_hld.c" is for detecting hardlockups
using perf, as evidenced by the line in the Makefile that only
compiles this file if CONFIG_HARDLOCKUP_DETECTOR_PERF is
defined. Rename the file to prepare for the buddy hardlockup detector,
which doesn't use perf.

It could be argued that the new name makes it less obvious that this
is a hardlockup detector. While true, it's not hard to remember that
the "perf" detector is always a hardlockup detector and it's nice not
to have names that are too convoluted.

Acked-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v4)

Changes in v4:
- ("Rename watchdog_hld.c to watchdog_perf.c") new for v4.

 kernel/Makefile                            | 2 +-
 kernel/{watchdog_hld.c => watchdog_perf.c} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename kernel/{watchdog_hld.c => watchdog_perf.c} (99%)

diff --git a/kernel/Makefile b/kernel/Makefile
index b69c95315480..7eb72033143c 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -91,7 +91,7 @@ obj-$(CONFIG_FAIL_FUNCTION) += fail_function.o
 obj-$(CONFIG_KGDB) += debug/
 obj-$(CONFIG_DETECT_HUNG_TASK) += hung_task.o
 obj-$(CONFIG_LOCKUP_DETECTOR) += watchdog.o
-obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF) += watchdog_hld.o
+obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF) += watchdog_perf.o
 obj-$(CONFIG_SECCOMP) += seccomp.o
 obj-$(CONFIG_RELAY) += relay.o
 obj-$(CONFIG_SYSCTL) += utsname_sysctl.o
diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_perf.c
similarity index 99%
rename from kernel/watchdog_hld.c
rename to kernel/watchdog_perf.c
index 2125b09e09d7..8b8015758ea5 100644
--- a/kernel/watchdog_hld.c
+++ b/kernel/watchdog_perf.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Detect hard lockups on a system
+ * Detect hard lockups on a system using perf
  *
  * started by Don Zickus, Copyright (C) 2010 Red Hat, Inc.
  *
-- 
2.40.1.698.g37aff9b760-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
