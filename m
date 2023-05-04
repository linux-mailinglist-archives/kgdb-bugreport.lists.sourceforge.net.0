Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FF36F7908
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 00:22:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puhL2-0005Rp-Vy
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 04 May 2023 22:22:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puhL0-0005Ri-Tj
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OARDe2WGhGJ9YL28VnMtRA2erbfr4XRakwTJsFcap5I=; b=dyq9GoAx7JTnenRVEnAGTie3+5
 UXpHJd8shgpDahKZgKWXB6Te1YsVLDcpx0EV4MbAoD+h6uVlLgoiHj82VYGhxBxaco0Peg7gHNfia
 zTPR/ZDPWFiTTl4d+ps81FjHjr1gW3jtLcF3+6iiAz6F9XkMtKiVHdBSzZimDDtArfTQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OARDe2WGhGJ9YL28VnMtRA2erbfr4XRakwTJsFcap5I=; b=Plmnwe/+EkZqTKqiR4ZtGpTghC
 tWJWy7WzuIvIf29Pi5b9270zHyKIAFTwJ0+SBy7IO4q72sBs1g9eeenwTGr1r/9VoN79NtmfOecZV
 M1QsWYGcMBFGriaJUEiXMcFxT4dWwZc/GCRXWM8rTrPK0lldpSssMLCTOXEydnsE8e9Q=;
Received: from mail-io1-f50.google.com ([209.85.166.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puhKx-0005TV-Fj for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:22:11 +0000
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-763c3429aa6so76570439f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683238922; x=1685830922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OARDe2WGhGJ9YL28VnMtRA2erbfr4XRakwTJsFcap5I=;
 b=WmEa/zcM9eNOiQ34PMOXzguSECEDyQDr8T2SNdMc47h+nUpOVyj282RE26xOrWmGD+
 Z+r6KyenymlCIZ/zorgJmAWZEEemM/Bg/EPdPMXpIv50V0KMO492J0Ecu2uLkr9WKt2e
 x3dus/gnsmk9rAGeufsd0kliCcSz0A22IVBHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683238922; x=1685830922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OARDe2WGhGJ9YL28VnMtRA2erbfr4XRakwTJsFcap5I=;
 b=f2A2igVEh/Lo3lvj/UrHCqRWJccESw/R6mZ4uNMcZhOz8wFVWPJwxV1Y9K3k3i907i
 DQNAJAg2BvV9N3taoO3QduG5VivpQ0WO71sbgfVxMyeBzeDij2H6m0jNTNdYXQn/acCI
 WS4OK98YGj75RdKz4wwePhk2QrZX0SJnh8ISnSZ6t62MG5+wI9X2novqbG2n+QO9yBAp
 Eunjkbq0Hwi1Isj6rXJw5IXsU6/pfZaS/f95fJ1+V7GpXPDCcM9ySwXmNt+yKAYUYlTR
 UeL9zkycK+nESMWJtibZ/FK3poEcNnhOcp0Bx1px1P+UjveZ7jIiAwEQBClF8PPvKsno
 tstg==
X-Gm-Message-State: AC+VfDxljr4MlMRmmj6mVclDpTrBdsIMKtK1BxchwwoPlzDGOpmgw1Lk
 uqMCCZdy1pRAl+wx1xekKisPTdyyipp03eLMQxY=
X-Google-Smtp-Source: ACHHUZ6K/GWZgHBRK8tXvn/IygmeZOoqhhON0G5s9GMpGhU7noise7S5Zr5rOpk3+MOxdT0Gz+Ye2Q==
X-Received: by 2002:aa7:8885:0:b0:643:74a1:6dbd with SMTP id
 z5-20020aa78885000000b0064374a16dbdmr4174511pfe.30.1683238508951; 
 Thu, 04 May 2023 15:15:08 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
 by smtp.gmail.com with ESMTPSA id
 g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 15:15:07 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  4 May 2023 15:13:40 -0700
Message-ID: <20230504151100.v4.8.I818492c326b632560b09f20d2608455ecf9d3650@changeid>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <20230504221349.1535669-1-dianders@chromium.org>
References: <20230504221349.1535669-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  These are tiny style changes: - Add a blank line before a
 "return". - Renames two globals to use the "watchdog_hld" prefix. - Store
 processor id in "unsigned int" rather than "int". - Minor comment re [...]
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.50 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puhKx-0005TV-Fj
Subject: [Kgdb-bugreport] [PATCH v4 08/17] watchdog/hardlockup: Style
 changes to watchdog_hardlockup_check() / ..._is_lockedup()
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
 Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, ito-yuichi@fujitsu.com,
 linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

These are tiny style changes:
- Add a blank line before a "return".
- Renames two globals to use the "watchdog_hld" prefix.
- Store processor id in "unsigned int" rather than "int".
- Minor comment rewording.
- Use "else" rather than extra returns since it seemed more symmetric.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("Style changes to watchdog_hardlockup_check ...") new for v4.

 kernel/watchdog.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 2d319cdf64b9..f46669c1671d 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -89,8 +89,8 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
 
 static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts);
 static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
-static DEFINE_PER_CPU(bool, hard_watchdog_warn);
-static unsigned long hardlockup_allcpu_dumped;
+static DEFINE_PER_CPU(bool, watchdog_hardlockup_processed);
+static unsigned long watchdog_hardlockup_dumped_stacks;
 
 static bool watchdog_hardlockup_is_lockedup(void)
 {
@@ -100,6 +100,7 @@ static bool watchdog_hardlockup_is_lockedup(void)
 		return true;
 
 	__this_cpu_write(hrtimer_interrupts_saved, hrint);
+
 	return false;
 }
 
@@ -110,21 +111,20 @@ static void watchdog_hardlockup_interrupt_count(void)
 
 void watchdog_hardlockup_check(struct pt_regs *regs)
 {
-	/* check for a hardlockup
-	 * This is done by making sure our timer interrupt
-	 * is incrementing.  The timer interrupt should have
-	 * fired multiple times before we overflow'd.  If it hasn't
+	/*
+	 * Check for a hardlockup by making sure the CPU's timer
+	 * interrupt is incrementing. The timer interrupt should have
+	 * fired multiple times before we overflow'd. If it hasn't
 	 * then this is a good indication the cpu is stuck
 	 */
 	if (watchdog_hardlockup_is_lockedup()) {
-		int this_cpu = smp_processor_id();
+		unsigned int this_cpu = smp_processor_id();
 
-		/* only print hardlockups once */
-		if (__this_cpu_read(hard_watchdog_warn) == true)
+		/* Only handle hardlockups once. */
+		if (__this_cpu_read(watchdog_hardlockup_processed))
 			return;
 
-		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n",
-			 this_cpu);
+		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n", this_cpu);
 		print_modules();
 		print_irqtrace_events(current);
 		if (regs)
@@ -137,18 +137,16 @@ void watchdog_hardlockup_check(struct pt_regs *regs)
 		 * generating interleaving traces
 		 */
 		if (sysctl_hardlockup_all_cpu_backtrace &&
-				!test_and_set_bit(0, &hardlockup_allcpu_dumped))
+		    !test_and_set_bit(0, &watchdog_hardlockup_dumped_stacks))
 			trigger_allbutself_cpu_backtrace();
 
 		if (hardlockup_panic)
 			nmi_panic(regs, "Hard LOCKUP");
 
-		__this_cpu_write(hard_watchdog_warn, true);
-		return;
+		__this_cpu_write(watchdog_hardlockup_processed, true);
+	} else {
+		__this_cpu_write(watchdog_hardlockup_processed, false);
 	}
-
-	__this_cpu_write(hard_watchdog_warn, false);
-	return;
 }
 
 #else /* CONFIG_HARDLOCKUP_DETECTOR_PERF */
-- 
2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
