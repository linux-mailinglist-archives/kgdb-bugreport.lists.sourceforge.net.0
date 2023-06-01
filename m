Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C1A71F4D5
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  1 Jun 2023 23:37:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q4pyv-00064U-94
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 01 Jun 2023 21:37:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q4pyu-00064K-7D
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3FwIy9pdxSPLLDGVrHowuSMAgkehvs21QOIs4DuKC6A=; b=GlaHlXyfxu4LHdlNlHbQoJHZ7E
 xke6LDsbLbM/gOw/0s5YnOva/sXhEidYAEsxiC8FctBf4DHXkUTJ4SKKZl0/ax33koru+87MjaxXl
 R4DqslKiERJZatlsAIdmzRexr70fLs3aE/mhtx2GVnE3d3mfqropp+6TGYiNx+opNhNU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3FwIy9pdxSPLLDGVrHowuSMAgkehvs21QOIs4DuKC6A=; b=XDf79T6VdPeBbr+iCHdbs9m2UI
 eoK+31FYXi3vVFmqOlHkgPF75xyuWkKtXHEJiElpl3le9OQ9J3qERjdgihgg/S7YD1H7Y7DTjmEcT
 YQGFyixwJyRzian95acIiyp+cSP2Ya3tz1hjyympIw2yz7lpeXuSimn7vU0F2FJiXRJM=;
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4pyt-0005Bs-J9 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:37:16 +0000
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-64d247a023aso1064094b3a.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 01 Jun 2023 14:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685655430; x=1688247430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3FwIy9pdxSPLLDGVrHowuSMAgkehvs21QOIs4DuKC6A=;
 b=MRdCoSujmCnjjOacpNHectteICFpfTy0Q7HRW6iFcJoXa0fZhuuEBFYooU/G8NXg2X
 HfAG3gvX2a17Cc1yGXHsw3CBdxIMjz24Xa8DvLZVxCCds24Mumi4TVNGg8ZmNyV/Svls
 MmHnVj0glIpRBoHcvAP9y7A/SWAwUDBE3yhk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685655430; x=1688247430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3FwIy9pdxSPLLDGVrHowuSMAgkehvs21QOIs4DuKC6A=;
 b=HeD4Twq1cSwZb+4oyDrlnR/JdfY31+/VC4m2DZCv9W+62IhNr8zdhq5XcqZReN/7uy
 +SJQTJ8OI2wtH2oZUjbeZEBooHuU00Mcl/ejIZTigLPRohWNYY/d3cZuBffywCM2dPTi
 7ygNERZXmBcJ8aQKIWYvgbik3bwG9Zjoce38qqaRXn10iePcfZ6JfcKGesXFHrxiYRbl
 YmXl9osvJ8NVOPoDL5eoSlPMmeh43R4LhMMv/4KRewtG6N1crzuN/7xynvjH2BF53N8p
 xXnVqnFOdv1iDovC+FFdbMYpxk78XGTjxhTh7Mfsz5RsNiHr7A7Fs46hNleENqSgGvJ2
 GHgw==
X-Gm-Message-State: AC+VfDx0cCrrrvS0vh+TK3HTdlYbF66YrghbG5jnsp1kkr2p7xoYOoQJ
 3pxX+vdYR3nbenzL9trSH6mivA==
X-Google-Smtp-Source: ACHHUZ50Zg9SNzhD1Ge9escgQjcb0Fjlmif9dRJ8OFu2NuLSDjuQFm2OhosoWIATYrGHV8blhpW1FQ==
X-Received: by 2002:a05:6a20:2451:b0:106:c9b7:c92f with SMTP id
 t17-20020a056a20245100b00106c9b7c92fmr8938270pzc.49.1685655429931; 
 Thu, 01 Jun 2023 14:37:09 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:11b8:2d2:7e02:6bff])
 by smtp.gmail.com with ESMTPSA id
 g22-20020aa78756000000b0064d48d98260sm5319534pfo.156.2023.06.01.14.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 14:37:09 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Thu,  1 Jun 2023 14:31:46 -0700
Message-ID: <20230601143109.v9.2.I4baba13e220bdd24d11400c67f137c35f07f82c7@changeid>
X-Mailer: git-send-email 2.41.0.rc2.161.g9c6817b8e7-goog
In-Reply-To: <20230601213440.2488667-1-dianders@chromium.org>
References: <20230601213440.2488667-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As per the (somewhat recent) comment before the definition
 of `__cpuidle`, the tag is like `noinstr` but also marks a function so it
 can be identified by cpu_in_idle(). Let'a add this. After doing this then
 when we dump stack traces of all processors using nmi_cpu_backtrace() then
 instead of getting useless backtraces we get things like: 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.172 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.172 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4pyt-0005Bs-J9
Subject: [Kgdb-bugreport] [PATCH v9 2/7] arm64: idle: Tag the arm64 idle
 functions as __cpuidle
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
Cc: Ingo Molnar <mingo@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Frederic Weisbecker <frederic@kernel.org>, ito-yuichi@fujitsu.com,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

As per the (somewhat recent) comment before the definition of
`__cpuidle`, the tag is like `noinstr` but also marks a function so it
can be identified by cpu_in_idle(). Let'a add this.

After doing this then when we dump stack traces of all processors
using nmi_cpu_backtrace() then instead of getting useless backtraces
we get things like:

  NMI backtrace for cpu N skipped: idling at cpu_do_idle+0x94/0x98

NOTE: this patch won't make cpu_in_idle() work perfectly for arm64,
but it doesn't hurt and does catch some cases. Specifically an example
that wasn't caught in my testing looked like this:

 gic_cpu_sys_reg_init+0x1f8/0x314
 gic_cpu_pm_notifier+0x40/0x78
 raw_notifier_call_chain+0x5c/0x134
 cpu_pm_notify+0x38/0x64
 cpu_pm_exit+0x20/0x2c
 psci_enter_idle_state+0x48/0x70
 cpuidle_enter_state+0xb8/0x260
 cpuidle_enter+0x44/0x5c
 do_idle+0x188/0x30c

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v9:
- Added to commit message that this doesn't catch all cases.

Changes in v8:
- "Tag the arm64 idle functions as __cpuidle" new for v8

 arch/arm64/kernel/idle.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/idle.c b/arch/arm64/kernel/idle.c
index c1125753fe9b..05cfb347ec26 100644
--- a/arch/arm64/kernel/idle.c
+++ b/arch/arm64/kernel/idle.c
@@ -20,7 +20,7 @@
  *	ensure that interrupts are not masked at the PMR (because the core will
  *	not wake up if we block the wake up signal in the interrupt controller).
  */
-void noinstr cpu_do_idle(void)
+void __cpuidle cpu_do_idle(void)
 {
 	struct arm_cpuidle_irq_context context;
 
@@ -35,7 +35,7 @@ void noinstr cpu_do_idle(void)
 /*
  * This is our default idle handler.
  */
-void noinstr arch_cpu_idle(void)
+void __cpuidle arch_cpu_idle(void)
 {
 	/*
 	 * This should do all the clock switching and wait for interrupt
-- 
2.41.0.rc2.161.g9c6817b8e7-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
