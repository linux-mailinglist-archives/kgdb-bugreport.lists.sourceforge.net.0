Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D1A784C0A
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 22 Aug 2023 23:30:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qYYxk-0005Ly-5Z
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 22 Aug 2023 21:30:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qYYxi-0005Lp-Ef
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 21:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DRXZdprKPZs0xk/TIH25QXtGg9YiAlfKIIpohS5vrjQ=; b=VQaqlaY6SSqFQ0165n0P2zVRwi
 uOiY7JL9izQS5+VPI8XG8vlMUV+f0KIkT9w4dukqkq8LlQB8OfyvZshpY65tBofGULDTkdHNPXpEv
 3aCZyxB+YwSHKNPv8TV4A6I0dm2lHvbtH9M2DHvjynNYZcWhTCxvOcGWO5thLPm9+CZo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DRXZdprKPZs0xk/TIH25QXtGg9YiAlfKIIpohS5vrjQ=; b=aBADQe81MWOYpE67XTVa9reV1i
 Sy+fnj/AmM5Vb3joZzxUhbKGgjoShB3RQIzbB97uV7b4x65OcfBoAT7EipsXVBMlSPkaQWgBgj5cp
 uVmdBUYYh2ZePCnvdBJiIH8QOJRUFfXN594IadH8qiimxfr8JEfrEMUBxVenE4qOhqD8=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qYYxh-00Cf5V-D1 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 21:30:55 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1bee82fad0fso32295465ad.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 22 Aug 2023 14:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692739848; x=1693344648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DRXZdprKPZs0xk/TIH25QXtGg9YiAlfKIIpohS5vrjQ=;
 b=VC9hZKzbdMPhWPoT/CJpgKx+lHz3MuRKi7xqq07FBHgIMAV6jdjAsGxc2oPCq5LdiD
 FT9TBosfHaLzOnTftw1blVl3kZEL5lLkpIenrJsSd4HqMrukFEHtIYNNkoT19AyNPYqZ
 XWLrShyvPU7jO3ZGVV82MhHq4fTZ7rwjwD5kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692739848; x=1693344648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DRXZdprKPZs0xk/TIH25QXtGg9YiAlfKIIpohS5vrjQ=;
 b=YDj6Qvuc6l36jdHJQ8o987CuFOjRyCAYhn+LaY9RgUzrOZqOvX09E632TWWJptOVZu
 boHAY4lKlPhsPHKJUKrcGtzhSO4pYwVE+yJJeevZ22qi+qb8tnx/2XHlDk74eM3PW+q3
 J/ABWHeFxk3kwlzqLFMB0QisF4Z1ygeCTEVtrdI6Nf63iavyd+UhXUyYrDcTvgv4WKSw
 1wNI2xOAucvBF4qky0lzBVTrYRhT+WRu8zQvvddUhr8T1BJUcDz9brzh/SE9P5IPNc0X
 1JGnSmz5N3RQDPqPMDlKHesg7IE8jGoeDXhRfE7eLKWEWVRTcxKk3zncmb6caZl+rqgy
 oWwQ==
X-Gm-Message-State: AOJu0YzE3K6I5f0Q104uZh7QVb06EPfvyVHMEhSJp81dwLX4wAt40Iii
 vjG2QZyKgqj42ktwHNnmB0C7XFxc1Q/DFNlEPydhltfW
X-Google-Smtp-Source: AGHT+IHOe4StZk9p/o2Zvwe4Q/iRgNulteHoQQ85TwT9W8Rl6RYQ6kjOCWG1GGHBmeC9Gt4Hw7/U1A==
X-Received: by 2002:a17:903:234a:b0:1bf:4833:9c2b with SMTP id
 c10-20020a170903234a00b001bf48339c2bmr10564192plh.31.1692739847743; 
 Tue, 22 Aug 2023 14:30:47 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:83f0:2bc5:38c4:a9de])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a170902e84700b001befac3b3cbsm9451475plg.290.2023.08.22.14.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 14:30:47 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Tue, 22 Aug 2023 14:26:57 -0700
Message-ID: <20230822142644.v10.2.I4baba13e220bdd24d11400c67f137c35f07f82c7@changeid>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230822212927.249645-1-dianders@chromium.org>
References: <20230822212927.249645-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.178 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qYYxh-00Cf5V-D1
Subject: [Kgdb-bugreport] [PATCH v10 2/6] arm64: idle: Tag the arm64 idle
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Frederic Weisbecker <frederic@kernel.org>, ito-yuichi@fujitsu.com,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Guo Ren <guoren@kernel.org>,
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

Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v9)

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
