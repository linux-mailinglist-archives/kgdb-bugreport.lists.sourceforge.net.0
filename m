Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C775178758C
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 24 Aug 2023 18:39:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qZDMI-0004fU-Hx
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 24 Aug 2023 16:38:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qZDMH-0004fM-69
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 24 Aug 2023 16:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S8LQV3FZTWxLTg8jNgV7yvfSpimnidUcb0tZukELwI8=; b=dPJP0VmbHbOudF8YOEDrQwiQyX
 yeoaitMrjX5d5P6tuJZi1Io+tvML7JUlhPnRMKHYsQ+rG5ufq8w+Q4CM6+fLmY5tpCylLJz3k2QbD
 sXZFBQniU+OQNy2T39Av4SN+hQzB3oE0dCsw8ebWeUS7/lCLdHNsapQQanmD6Jo+j+WI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S8LQV3FZTWxLTg8jNgV7yvfSpimnidUcb0tZukELwI8=; b=HVdRb3ppAN8D+OKg83JAFZdo+f
 UDgJ4MArddAogErGe8I/qvsDy0HrB7WEDHwIkL/Va9N4/VDXJF6ZiXYmpAuokJ+PMPTmwk0S7jRiO
 VEgvgpHMkLa6wvnlCQ6G/9x+uaegifNNqxX7w4CWIGXnefEYP7VCb7KdBYT6g9kMjy7c=;
Received: from mail-oa1-f54.google.com ([209.85.160.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZDMH-00ER4m-HS for kgdb-bugreport@lists.sourceforge.net;
 Thu, 24 Aug 2023 16:38:58 +0000
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-1c8c44053e8so42657fac.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 24 Aug 2023 09:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692895132; x=1693499932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S8LQV3FZTWxLTg8jNgV7yvfSpimnidUcb0tZukELwI8=;
 b=A5URS9y9Mvkg+XwdxSGI3BndvpTrdnK9kvmubkcVJfFDyCQvvGJcNm2sKWemcsD6Pn
 LPunKajajX59XoAe+lSk26hfWFb0NC56OEcq02HHKscRBOmrCR8wWzk3KmTto6IUYVjd
 xykFJRAfKjFUt0mtaxuPZdPw//hVbPMrgMZRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692895132; x=1693499932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S8LQV3FZTWxLTg8jNgV7yvfSpimnidUcb0tZukELwI8=;
 b=fv+/HyPlx/JAq9TjvltVryZNuF3WF93pPR0gt3QBa4lVCDxhZGB1UC0nVPmb0+7hQe
 M5lCaF/Yr0w8vj2KUfeVKrZqDgNjrZJfUL5cKg+AAWA5IMe9uX+4d86CoyOicDy8MflJ
 tQ8CfBW+LXiKtC4g9PvRueCbxlvHSE9sQUb5+MOYp2HQLMbMhEwtSZb9MX04CsK8f+9w
 bAo8EuWWaTlyhZyrmbSNtySYXG/VwLC4OSy022AmzI5PXlD8rtsf3c+7bXrs9hC3n1Wu
 YYkThGvriU1JzMLFk2+77VIvyVou/NpSwK62kXEZwa1uQlXFxqz4foA8qtSHwGJzkqkk
 pvqQ==
X-Gm-Message-State: AOJu0YzPE+v+bW3W/j42Wt4/o43grpn1ib0HeWekrBIbnpA2OCXzecQ6
 dBXpB/rjJGDqUpBpvo7Pwqr3LpFrZXqg5CtrUwZ61TBX
X-Google-Smtp-Source: AGHT+IHtE7/RbB67nJdYB/Ae0mTQ0RJ8uJ9wBeYpGrn270z6LtX1u8780/eo8q0EyT04aZwzQcfYQg==
X-Received: by 2002:a05:6a20:9187:b0:125:4d74:cd6a with SMTP id
 v7-20020a056a20918700b001254d74cd6amr22207369pzd.3.1692891182940; 
 Thu, 24 Aug 2023 08:33:02 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:afa3:fcf5:1b7f:f7e2])
 by smtp.gmail.com with ESMTPSA id
 m30-20020a63711e000000b0056365ee8603sm11631337pgc.67.2023.08.24.08.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 08:33:02 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Thu, 24 Aug 2023 08:30:28 -0700
Message-ID: <20230824083012.v11.2.I4baba13e220bdd24d11400c67f137c35f07f82c7@changeid>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824153233.1006420-1-dianders@chromium.org>
References: <20230824153233.1006420-1-dianders@chromium.org>
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
 can be identified by cpu_in_idle(). Let's add these markings to arm [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.54 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.54 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qZDMH-00ER4m-HS
Subject: [Kgdb-bugreport] [PATCH v11 2/6] arm64: idle: Tag the arm64 idle
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
Cc: Ingo Molnar <mingo@kernel.org>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Frederic Weisbecker <frederic@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Guo Ren <guoren@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

As per the (somewhat recent) comment before the definition of
`__cpuidle`, the tag is like `noinstr` but also marks a function so it
can be identified by cpu_in_idle(). Let's add these markings to arm64
cpuidle functions

With this change we get useful backtraces like:

  NMI backtrace for cpu N skipped: idling at cpu_do_idle+0x94/0x98

instead of useless backtraces when dumping all processors using
nmi_cpu_backtrace().

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

Acked-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v11:
- Updated commit message as per Stephen.

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
2.42.0.rc1.204.g551eb34607-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
