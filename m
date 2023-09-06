Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 081287942B1
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  6 Sep 2023 20:04:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qdwsn-0006Pr-Bw
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 06 Sep 2023 18:04:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qdv2k-00053o-Ts
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 06 Sep 2023 16:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=75Al5ao5WDqui4OmFiH4pa1bGdzkgKG2d24XEXDdpOo=; b=iyIBCYj1HCkD8diAM7GL0/789a
 b6IHmu+gLUYzdga1zKV0oWe+sKGvwsSskVYPyxOURSH4d93nwrG0NUvPxkjmh20QLpOMpvZ93dtff
 mOKgj9nG625BKpKup0FqX9Y6rQIyij0fc7+D6z+Aoe+vut/2zifIQ+wKF5EAM+fS0YlU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=75Al5ao5WDqui4OmFiH4pa1bGdzkgKG2d24XEXDdpOo=; b=MJvJoXgYxd4QSaL5vRZpzxsWPR
 z3M/LPZUT8R8uTyVHU10u6mqfgDROMDlxqPZNPl/Lgi3B7310qWpDMnUpepdcU7GqCYcp+EOAaCoD
 Hb2ww1dCAIAoxCHeHUd1X4vEUdPhArFAtTjms/ypEzkmq45aZf+lF3peiBoiSA6lp3qo=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qdv2h-0003zh-HU for kgdb-bugreport@lists.sourceforge.net;
 Wed, 06 Sep 2023 16:06:15 +0000
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1c0d5b16aacso26273775ad.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 06 Sep 2023 09:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694016366; x=1694621166;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=75Al5ao5WDqui4OmFiH4pa1bGdzkgKG2d24XEXDdpOo=;
 b=OvV56wNk8Jqhz+mJqhx3Vc5fQQOvCXXcqNjH3Kz+3Erg2qhAgW+QpeYUUFCiKIaM02
 wIXGo1HIS9Zc6IOJp7MuWtfSoL0AkUo5bWL1UU6+Qw8Z0J4A1ISfBU8UsGA2ENk6wWA0
 N2Xqo7CCp3PZbCdIQkLyK03eQRnps+k06FJAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694016366; x=1694621166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=75Al5ao5WDqui4OmFiH4pa1bGdzkgKG2d24XEXDdpOo=;
 b=ISHtPvV+ccFbIf3W2z2Ufd0fA07MrUtQJxOaZ+u2FdT4MZXncXdbd92tkWub9mBi4Q
 cOH+AiTaAmkuYruvV5bVg7434ktCgHQxyudaAPpRNXq+j1ZFj6WMI9JPQlcb72UBYzHr
 NP5AA0Rj9dZfdVDioU4dw1gz5gA+J3klc6K09EXM83Nhbpfc/cVb2lSrNoQ9tjuhlR2B
 3wEJd+Vn587Fwrevx5i1bazoJgP/1H8H5g/Ls6bJbC9v1WXKv+dnU9cCjegk3CE1VXV/
 Ewks4FHYO6iDBnj5vXoXNbzlvmGv/DL03ftVK+w28YwUcYdRtp2fVOYtqkbq2+lVtE8u
 W8wA==
X-Gm-Message-State: AOJu0YzrnAu+scR2AhEQRxTugucuA+hhVY6wMzRj3UTPuJHwBQOjuoNd
 yb7gHZkoKUpLpMVcVL5nFMB7Ww==
X-Google-Smtp-Source: AGHT+IFaCX4dzk7MQ4n11lP2A0zTWCxziDQ4gl6uWPxHEa+/LvA96OgqNZMwWgUuk5iyV1hMWWWj0Q==
X-Received: by 2002:a17:902:c40a:b0:1c2:811:2cee with SMTP id
 k10-20020a170902c40a00b001c208112ceemr18484732plk.23.1694016365967; 
 Wed, 06 Sep 2023 09:06:05 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4a07:e00a:fdae:750b])
 by smtp.gmail.com with ESMTPSA id
 ju19-20020a170903429300b001b8c689060dsm11338859plb.28.2023.09.06.09.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 09:06:05 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Wed,  6 Sep 2023 09:02:57 -0700
Message-ID: <20230906090246.v13.2.I4baba13e220bdd24d11400c67f137c35f07f82c7@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230906160505.2431857-1-dianders@chromium.org>
References: <20230906160505.2431857-1-dianders@chromium.org>
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qdv2h-0003zh-HU
Subject: [Kgdb-bugreport] [PATCH v13 2/7] arm64: idle: Tag the arm64 idle
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
Cc: mingo@kernel.org, ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Stephane Eranian <eranian@google.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 gautham.shenoy@amd.com, Chen-Yu Tsai <wenst@chromium.org>,
 Tomohiro Misono <misono.tomohiro@fujitsu.com>,
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
Acked-by: Sumit Garg <sumit.garg@linaro.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v11)

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
2.42.0.283.g2d96d420d3-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
