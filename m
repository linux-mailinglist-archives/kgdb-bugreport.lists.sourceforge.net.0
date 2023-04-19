Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CC96E85D8
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 20 Apr 2023 01:23:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ppH8x-0007T0-9w
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 19 Apr 2023 23:23:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ppH8v-0007St-Rw
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LAvgM/34n0JSYhh4m4RBiwXsllZsYs4Vm4Z5FlxDAmU=; b=IEUI4AY9+6fNXxkOJ4K4PhDVFu
 fziZV+eAEOugF4xNQuaK28mnXKBtmvPryuK0t4q56JTL2896G0FtU5N6ON7bJ41uGkRcx8BmM6K+g
 8fZVbEYroSZgJVWyQ1ZpS5WEPumgv8O2PHLYjyJifzsJ4wisY7mSdGkX4Y1pKPIztnxg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LAvgM/34n0JSYhh4m4RBiwXsllZsYs4Vm4Z5FlxDAmU=; b=NbhfKtQ8QvHALqIkCuJ+WTVVkm
 bP7XLHl9h+yRcGBeoAR42NWHxIvkeSq8AAJYUX2PrxhXFc4UzxNyYHlFY8YwS+5a3eEr1A5YdxjNI
 X6P7KAMnH+5sZgjZzqAY8dKMnZeEhgc73Du4JWgg8kvVwN5DHnY5dSCYXWXz5fTF8jsY=;
Received: from mail-pg1-f173.google.com ([209.85.215.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ppH8o-00D6p8-HM for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:23:12 +0000
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-51efefe7814so324744a12.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 19 Apr 2023 16:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681946585; x=1684538585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LAvgM/34n0JSYhh4m4RBiwXsllZsYs4Vm4Z5FlxDAmU=;
 b=lDY+nU1CX0x/3vU26v+a+T21bhoDOcRbz4FmtsKltVvWCZuplV/E4slBY2YSfxpteh
 lVEuPI9oXvBuI7Ze6tJ9mZlzzaP+V+u6OXWLAOEennpjMU6LEhRww5yc4CilQPEqO2GK
 kwiKGuq36O1/LbA7ZDYbzYUYgstfyxtb4RNAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681946585; x=1684538585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LAvgM/34n0JSYhh4m4RBiwXsllZsYs4Vm4Z5FlxDAmU=;
 b=EaI0eFQGagj45zHD9Xy8OwJxdYQE6euIpIdRMS4Rtk2B9NU5naFGVXEwlDYJhgcepF
 lOvYTneAWKF2aLKYntSJJnLyYeJYm91+tioA4IzXZT2oEUfABflOQwmKrvZwVDFeX8y4
 7yqi+ZQ8gMDJI8OI/UX5LCldSKT88tA3rWomCZNXtVd6zHfqZCTV3FrdTjFLOp6n0f/O
 bzom3sppCEPDJ5+cQ7gfoztZCRdjh5CQ28K/xmeS+gnFUyMLROAe5U/w48UWTnPyytk3
 cIHLqtKTx+a6kzRFfqsLspJga1N+VDUMMA4wcdmz/Xv1SU30N4uz+TDP0GAkAiNz/GF1
 jbsg==
X-Gm-Message-State: AAQBX9d58wgsCNAPBopddAwK0AOk+4FabD3pKv35pEDBgeMNENtKqcFo
 6S/cR9pyjCWQkIquEm8T87MOmSEhOJqMS0YjH2c=
X-Google-Smtp-Source: AKy350bskGi3gG2BFNjKoT98Z8InQIICEe7cMAmD5y5HyxnPAhqsWk+2bK2ye8CnL2CNs3knUxa76Q==
X-Received: by 2002:a17:90a:4142:b0:247:19c5:aa3d with SMTP id
 m2-20020a17090a414200b0024719c5aa3dmr4050436pjg.36.1681945035028; 
 Wed, 19 Apr 2023 15:57:15 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:8b1:fa03:670e:b784])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a17090aea8f00b00246ea338c96sm1847101pjz.53.2023.04.19.15.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 15:57:14 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Date: Wed, 19 Apr 2023 15:56:00 -0700
Message-ID: <20230419155341.v8.6.I4baba13e220bdd24d11400c67f137c35f07f82c7@changeid>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230419225604.21204-1-dianders@chromium.org>
References: <20230419225604.21204-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
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
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.173 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.173 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ppH8o-00D6p8-HM
Subject: [Kgdb-bugreport] [PATCH v8 06/10] arm64: idle: Tag the arm64 idle
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

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

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
2.40.0.634.g4ca3ef3211-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
