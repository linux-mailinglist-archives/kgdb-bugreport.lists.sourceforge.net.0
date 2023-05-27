Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B472713195
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 27 May 2023 03:42:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q2iwt-0002Cc-KR
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 27 May 2023 01:42:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q2iws-0002CR-7H
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FXckUaQ/Den31trhbx+i2KR50Js/yPFH+sDpvHnJKzE=; b=K/wy3Z9t3cSDj3EDB4BN6FviJI
 ZbmHr1bhfJELgBc+SRPindF7pbF6Idq3uiJJVxE8zgxeozBNzabZ73nqziAWMW5VwbUr0bOXSoN7W
 Z/EErDz4AkAGKssPnh9a+n37alTTpaHItMx4mCAnQ4fjyGg1gUDMLW/q5ZTB0x90/BBo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FXckUaQ/Den31trhbx+i2KR50Js/yPFH+sDpvHnJKzE=; b=JgaHatYLi9SSaDuC82sdQg1z+l
 yOhNhElOJWMEcpZyKX6vE9wWDs2sVEz1JMNLnH9EMkcrs/FW4+kbPgqFblvQV17Sw8sgsCt5qH/hM
 mmVK7mqP6nPkVbFvERDGeMVy0veAJHBbBrejQuQ3WeEa9AZ0AqcwF/M7b77a4xjx8zuw=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q2iwp-003o1m-KH for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:27 +0000
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-64d24136685so1081202b3a.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 May 2023 18:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685151738; x=1687743738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FXckUaQ/Den31trhbx+i2KR50Js/yPFH+sDpvHnJKzE=;
 b=k5hflWz1ojXxjFKRiwHgsk5p/ZbmXIIfYfK4EdK0UtXLo2Tbb74nHxOJ8I17Sf9sxy
 7MD+TcUADQQ+iohHT+1kqBlvhx1hOCsgxOD4ajd121XAcoVe7I9JgK6CPn4SYzCJm/ol
 YM9N2ByDO4u3BG+dWzNDW3yTIS6cbMGQWCxnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685151738; x=1687743738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FXckUaQ/Den31trhbx+i2KR50Js/yPFH+sDpvHnJKzE=;
 b=MwVptOUgwETp58AxdRvwhk0dpSs9tFDB4oUM03TbfSM35T5yOplBsFSiSBUr9e+O2r
 HaoVFi1DiVqCk2FhhJgsFwIrg0gIENX5ckBk+5vY05HuHjFbxJz5FJqYsqakcbqBKqk4
 EEsvdPjD6amZAV7JRZjwXzeZCZrLGq4adKLR79+NwOYHE/dyQf9tO9suaFW1d6k4658n
 863Z2w0s0RfDOfqchHMyXKKjBva954uvKFKzbnnvpmIN64VhBhVSET6v/tyYFQ8Hkhmq
 nph10wscSP0yN2piIL/c8ULLt/vnHPmsEqwGjQswVolWz4lsGvAO8Cyx3UiMP4BW2AeH
 nPSg==
X-Gm-Message-State: AC+VfDwK1BSI0qtB7WzbrSCgqGx990VW+FrmyTe/zv1+88ZuDGw00FvW
 x7BVOP+wba7BM8J2SRiSP67wzw==
X-Google-Smtp-Source: ACHHUZ7tQKomhZw+AyOO+6VKcS+sY1Y2WDAS5xt3xizvvLTbv73yPg/Ctnx4geaFhMkCoPBSd4R4lw==
X-Received: by 2002:a05:6a00:1586:b0:648:a518:4ac6 with SMTP id
 u6-20020a056a00158600b00648a5184ac6mr1023104pfk.14.1685151738030; 
 Fri, 26 May 2023 18:42:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4015:7255:c79a:26d7])
 by smtp.gmail.com with ESMTPSA id
 x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 18:42:17 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 26 May 2023 18:41:31 -0700
Message-ID: <20230526184139.1.I0d75971cc52a7283f495aac0bd5c3041aadc734e@changeid>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
In-Reply-To: <20230527014153.2793931-1-dianders@chromium.org>
References: <20230527014153.2793931-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The permissions for the kernel.nmi_watchdog sysctl have
 always
 been set at compile time despite the fact that a watchdog can fail to probe.
 Let's fix this and set the permissions based on whether the [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.171 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2iwp-003o1m-KH
Subject: [Kgdb-bugreport] [PATCH 01/10] watchdog/hardlockup: Keep
 kernel.nmi_watchdog sysctl as 0444 if probe fails
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-perf-users@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The permissions for the kernel.nmi_watchdog sysctl have always been
set at compile time despite the fact that a watchdog can fail to
probe. Let's fix this and set the permissions based on whether the
hardlockup detector actually probed.

Fixes: a994a3147e4c ("watchdog/hardlockup/perf: Implement init time detection of perf")
Reported-by: Petr Mladek <pmladek@suse.com>
Closes: https://lore.kernel.org/r/ZHCn4hNxFpY5-9Ki@alley
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/nmi.h |  6 ------
 kernel/watchdog.c   | 30 ++++++++++++++++++++----------
 2 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 333465e235e1..3a27169ec383 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -95,12 +95,6 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs);
 static inline void arch_touch_nmi_watchdog(void) { }
 #endif
 
-#if defined(CONFIG_HAVE_NMI_WATCHDOG) || defined(CONFIG_HARDLOCKUP_DETECTOR)
-# define NMI_WATCHDOG_SYSCTL_PERM	0644
-#else
-# define NMI_WATCHDOG_SYSCTL_PERM	0444
-#endif
-
 #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
 extern void hardlockup_detector_perf_stop(void);
 extern void hardlockup_detector_perf_restart(void);
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 237990e8d345..4b9e31edb47f 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -880,15 +880,6 @@ static struct ctl_table watchdog_sysctls[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= (void *)&sixty,
 	},
-	{
-		.procname       = "nmi_watchdog",
-		.data		= &watchdog_hardlockup_user_enabled,
-		.maxlen		= sizeof(int),
-		.mode		= NMI_WATCHDOG_SYSCTL_PERM,
-		.proc_handler   = proc_nmi_watchdog,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_ONE,
-	},
 	{
 		.procname	= "watchdog_cpumask",
 		.data		= &watchdog_cpumask_bits,
@@ -952,10 +943,28 @@ static struct ctl_table watchdog_sysctls[] = {
 	{}
 };
 
+static struct ctl_table watchdog_hardlockup_sysctl[] = {
+	{
+		.procname       = "nmi_watchdog",
+		.data		= &watchdog_hardlockup_user_enabled,
+		.maxlen		= sizeof(int),
+		.mode		= 0444,
+		.proc_handler   = proc_nmi_watchdog,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	},
+	{}
+};
+
 static void __init watchdog_sysctl_init(void)
 {
 	register_sysctl_init("kernel", watchdog_sysctls);
+
+	if (watchdog_hardlockup_available)
+		watchdog_hardlockup_sysctl[0].mode = 0644;
+	register_sysctl_init("kernel", watchdog_hardlockup_sysctl);
 }
+
 #else
 #define watchdog_sysctl_init() do { } while (0)
 #endif /* CONFIG_SYSCTL */
@@ -1011,6 +1020,8 @@ static int __init lockup_detector_check(void)
 	/* Make sure no work is pending. */
 	flush_work(&detector_work);
 
+	watchdog_sysctl_init();
+
 	return 0;
 
 }
@@ -1030,5 +1041,4 @@ void __init lockup_detector_init(void)
 		allow_lockup_detector_init_retry = true;
 
 	lockup_detector_setup();
-	watchdog_sysctl_init();
 }
-- 
2.41.0.rc0.172.g3f132b7071-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
