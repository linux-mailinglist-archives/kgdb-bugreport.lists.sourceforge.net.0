Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07278713199
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 27 May 2023 03:42:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q2ix0-0004Ne-Gt
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 27 May 2023 01:42:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q2iwy-0004NP-TF
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4CpMXuml+REzVPCV5YpF8KcdPL/FMQZnR1a5DDg0o94=; b=TtTAXEV7hjlfqSUoYNI0Sg4edv
 DYLpCjdawDtXLGnGdMsddxBV/OJccSuFIFJKrhD0aaNVngqkji79vZjXmRWSlRSJJtqgo7Ssq+Izx
 hHrce9xnwcbs0WSF34uWwj6bEkXUMxIB9Dq2zdhKODDvlWU/MLJudOiRW3/KN9J0M+3k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4CpMXuml+REzVPCV5YpF8KcdPL/FMQZnR1a5DDg0o94=; b=SpMWpfkPxHII/7Pb3iEseu8SM0
 OSZlbcstSAhEpOi9iWfkNDrHfERUeq5gedus9YSmqR3rfINmt09vvHQhC0QjyvINmfxXvgRDmFmeI
 DpuJ/inJmxDw5OZBhm0YVN6pOZn2Mhw31EeNYB/7/xwYRcDR7hTsdfPLJ5LecXMShspM=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q2iwy-003o2E-EJ for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:32 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-64d2e8a842cso1214091b3a.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 May 2023 18:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685151752; x=1687743752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4CpMXuml+REzVPCV5YpF8KcdPL/FMQZnR1a5DDg0o94=;
 b=lWWP/2wciP5Lcnvzvjsar/98gic2UMLjL7shy/u4jcBVbG5MnQbC3jVJH8wV32l4xR
 /nrvT+VbnmoHL7WUx9Zoh+UT6oazi8OyVzo4oafQGAwcJbnMk2/Hi1w+wVB/DP/r1xpp
 TGm6jAwztGOFKItK9wAegBPuXnpdHRPuC12Ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685151752; x=1687743752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4CpMXuml+REzVPCV5YpF8KcdPL/FMQZnR1a5DDg0o94=;
 b=khOl5gSYWSSnUZxaNA23/G+5Ug7wRTGjBw6it0ppb6KivpuYFU8k4pDRqjY07x3Q7e
 bsvhnKqzlXwHQHm3kQw59uygV3L0LgRTYh3StjefEAff+oFmEbkY6DxMCb/2YBPNOPpB
 1bK5x0MGUHQHF8SlRL4hJQ4KNHX7s29oc3/0zuL78fLLl1DIrGRolfey0fHfBGQo7bN2
 D6qglBk7Sn9Jn01qhstVjmTGe1hYz+Cf5Iju11AuVQjOlQCibSDklj5z3yEzSTGU/nST
 n0zOAMlqd7JWvTMOOiy9zDLUx85gjrME7GqGPlmwaYB3gPa/Ym4Cn50glnviFf5EScvx
 kcQg==
X-Gm-Message-State: AC+VfDyIKnwtyvl094iQc0MEr48GhKF6Wg2udOQWIE3eqOX+Oy19bcW8
 aBiwL/ev1CH3iIOj1okZJhcnog==
X-Google-Smtp-Source: ACHHUZ6DB7hFCO3S8IN2pb5iImgPKyxBk6jrI7pr6oeNwgGoZm+rSryxNvvUZrHJqd9sGrPZ5NEogQ==
X-Received: by 2002:a05:6a20:2d2a:b0:10c:7c72:bdd6 with SMTP id
 g42-20020a056a202d2a00b0010c7c72bdd6mr1357189pzl.59.1685151752164; 
 Fri, 26 May 2023 18:42:32 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4015:7255:c79a:26d7])
 by smtp.gmail.com with ESMTPSA id
 x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 18:42:31 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 26 May 2023 18:41:39 -0700
Message-ID: <20230526184139.9.I5ab0a0eeb0bd52fb23f901d298c72fa5c396e22b@changeid>
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
 Content preview: It's been suggested that since the SMP barriers are only
 potentially
 useful for the buddy hardlockup detector, not the perf hardlockup detector,
 that the barriers belong in the buddy code. Let's move [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.169 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2iwy-003o2E-EJ
Subject: [Kgdb-bugreport] [PATCH 09/10] watchdog/hardlockup: Move SMP
 barriers from common code to buddy code
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

It's been suggested that since the SMP barriers are only potentially
useful for the buddy hardlockup detector, not the perf hardlockup
detector, that the barriers belong in the buddy code. Let's move them
and add clearer comments about why they're needed.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/watchdog.c       |  6 ------
 kernel/watchdog_buddy.c | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 6cc46b8e3d07..a351ab0c35eb 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -109,9 +109,6 @@ EXPORT_SYMBOL(arch_touch_nmi_watchdog);
 void watchdog_hardlockup_touch_cpu(unsigned int cpu)
 {
 	per_cpu(watchdog_hardlockup_touched, cpu) = true;
-
-	/* Match with smp_rmb() in watchdog_hardlockup_check() */
-	smp_wmb();
 }
 
 static bool is_hardlockup(unsigned int cpu)
@@ -141,9 +138,6 @@ static void watchdog_hardlockup_kick(void)
 
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 {
-	/* Match with smp_wmb() in watchdog_hardlockup_touch_cpu() */
-	smp_rmb();
-
 	if (per_cpu(watchdog_hardlockup_touched, cpu)) {
 		per_cpu(watchdog_hardlockup_touched, cpu) = false;
 		return;
diff --git a/kernel/watchdog_buddy.c b/kernel/watchdog_buddy.c
index 2ef88722c5e7..34dbfe091f4b 100644
--- a/kernel/watchdog_buddy.c
+++ b/kernel/watchdog_buddy.c
@@ -51,6 +51,13 @@ void watchdog_hardlockup_enable(unsigned int cpu)
 	if (next_cpu < nr_cpu_ids)
 		watchdog_hardlockup_touch_cpu(next_cpu);
 
+	/*
+	 * Makes sure that watchdog is touched on this CPU before
+	 * other CPUs could see it in watchdog_cpus. The counter
+	 * part is in watchdog_buddy_check_hardlockup().
+	 */
+	smp_wmb();
+
 	cpumask_set_cpu(cpu, &watchdog_cpus);
 }
 
@@ -68,6 +75,13 @@ void watchdog_hardlockup_disable(unsigned int cpu)
 	if (next_cpu < nr_cpu_ids)
 		watchdog_hardlockup_touch_cpu(next_cpu);
 
+	/*
+	 * Makes sure that watchdog is touched on the next CPU before
+	 * this CPU disappear in watchdog_cpus. The counter part is in
+	 * watchdog_buddy_check_hardlockup().
+	 */
+	smp_wmb();
+
 	cpumask_clear_cpu(cpu, &watchdog_cpus);
 }
 
@@ -88,5 +102,12 @@ void watchdog_buddy_check_hardlockup(int hrtimer_interrupts)
 	if (next_cpu >= nr_cpu_ids)
 		return;
 
+	/*
+	 * Make sure that the watchdog was touched on next CPU when
+	 * watchdog_next_cpu() returned another one because of
+	 * a change in watchdog_hardlockup_enable()/disable().
+	 */
+	smp_rmb();
+
 	watchdog_hardlockup_check(next_cpu, NULL);
 }
-- 
2.41.0.rc0.172.g3f132b7071-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
