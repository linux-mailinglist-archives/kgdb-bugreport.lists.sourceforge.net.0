Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B72A971319B
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 27 May 2023 03:42:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q2ix4-0001uE-34
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 27 May 2023 01:42:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q2ix2-0001u8-Dy
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3LzYkR+VFFLH6wRBHL6FlKd+tRCEo62Tgi4gzgiGicM=; b=ZswokEmBJAZ6KyA6a/W7Z65a5S
 fd2oujXHM25RBC5qdWCQCfvE0M5LlJ/ASqeK2mlnzvpYZHQ0rQH0y64xrl6ZmYYxcW4g3r3606JKU
 33g/KP0KGwwn5LLbBnTpPzRuKFTc3ap5BZK9jPTu+MG3IpthqiAviZe9AgDy9FiJ5Tu8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3LzYkR+VFFLH6wRBHL6FlKd+tRCEo62Tgi4gzgiGicM=; b=kDnP25Zi8zSbmCMJqlvsKAfdm0
 0SHmVMCuiYT7BkfaW91mY2Erzks7K5qwscEJ2YS+LyOYIZlCmYLHjEYtHD0bKgAtg5U58qOZT+WRs
 +WxkVvhetFNr3hkqjXhPOwYVoX3y9ZzMl980YsxsqXeRSal2csoiOKnP5k5Q033lnzdU=;
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q2iwy-0002sf-FZ for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:36 +0000
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-64d4e4598f0so1805829b3a.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 May 2023 18:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685151747; x=1687743747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3LzYkR+VFFLH6wRBHL6FlKd+tRCEo62Tgi4gzgiGicM=;
 b=MJPM8uBHWtcGykg6NBnTXOlp/wt/zisapv2LqVrNAXkdImxD++McjkPouYYjhNBMZ/
 FtnMFxUfnwDPpZ8d3KsgOQlpZlNtaUXpmKC4q99ybOisJ5hfu5QhtX1wrIemYl3fq166
 Chku98BUooqaBLPGzQqvfd2wrHxDC0QaznFMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685151747; x=1687743747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3LzYkR+VFFLH6wRBHL6FlKd+tRCEo62Tgi4gzgiGicM=;
 b=PboSRzCUyO6EWBT4LZn6XG1cnpUEr941QMKmKVAmxyru8xt0dYWxvLCLFJB1gVgDal
 sXQokDFM64NzwSmZOzQcmERONm606iHsLsDS7IATTn6faU+5wz6PepUowxOfEuHG+mYC
 ThQ6YzmcQn/3Ggzu+Sx5kVR8GnxJPRgINQzhhc1IYDkt7SFyqcqMhZTm9Af8k5ttpYs+
 qbh9i68aBcnkAHaSj9IQ8QzfNWypxF5u3nVPLcSaA+DpHMpQX+zImc2A4Gn0h96Iu+D8
 AcBkIQalBTPaj22Zp11SthvqSmHl4d5n3q+Fc74k98Shx0EhoVvPE0Q2VzjZZHJhCg/K
 1neQ==
X-Gm-Message-State: AC+VfDx5UuctHbB/f7N0Ih+gTrmBUSNKpmjWZSdddVnqAA4CA/fdWK6d
 69Zjzp0YHiEm0/hfTfiAc5pV8g==
X-Google-Smtp-Source: ACHHUZ49rllat2/JyQzbGZ3WjkseglfJC0pbWMXitDuVE2AIZugbceGuvm9VVDVfo56QxxDU2q8Bew==
X-Received: by 2002:aa7:888e:0:b0:63b:8eeb:77b8 with SMTP id
 z14-20020aa7888e000000b0063b8eeb77b8mr6362327pfe.13.1685151746880; 
 Fri, 26 May 2023 18:42:26 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4015:7255:c79a:26d7])
 by smtp.gmail.com with ESMTPSA id
 x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 18:42:26 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 26 May 2023 18:41:36 -0700
Message-ID: <20230526184139.6.I006c7d958a1ea5c4e1e4dc44a25596d9bb5fd3ba@changeid>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
In-Reply-To: <20230527014153.2793931-1-dianders@chromium.org>
References: <20230527014153.2793931-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In the patch ("watchdog/hardlockup: detect hard lockups using
 secondary (buddy) CPUs"), we added a call from the common watchdog.c file
 into the buddy. That call could be done more cleanly. Specifical [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.173 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.173 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2iwy-0002sf-FZ
Subject: [Kgdb-bugreport] [PATCH 06/10] watchdog/buddy: Cleanup how
 watchdog_buddy_check_hardlockup() is called
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

In the patch ("watchdog/hardlockup: detect hard lockups using
secondary (buddy) CPUs"), we added a call from the common watchdog.c
file into the buddy. That call could be done more cleanly.
Specifically:
1. If we move the call into watchdog_hardlockup_kick() then it keeps
   watchdog_timer_fn() simpler.
2. We don't need to pass an "unsigned long" to the buddy for the timer
   count. In the patch ("watchdog/hardlockup: add a "cpu" param to
   watchdog_hardlockup_check()") the count was changed to "atomic_t"
   which is backed by an int, so we should match types.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/nmi.h     |  4 ++--
 kernel/watchdog.c       | 15 +++++++--------
 kernel/watchdog_buddy.c |  2 +-
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 6c6a5ce77c66..43893e5f858a 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -114,9 +114,9 @@ void watchdog_hardlockup_disable(unsigned int cpu);
 void lockup_detector_reconfigure(void);
 
 #ifdef CONFIG_HARDLOCKUP_DETECTOR_BUDDY
-void watchdog_buddy_check_hardlockup(unsigned long hrtimer_interrupts);
+void watchdog_buddy_check_hardlockup(int hrtimer_interrupts);
 #else
-static inline void watchdog_buddy_check_hardlockup(unsigned long hrtimer_interrupts) {}
+static inline void watchdog_buddy_check_hardlockup(int hrtimer_interrupts) {}
 #endif
 
 /**
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 85f4839b6faf..6cc46b8e3d07 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -131,9 +131,12 @@ static bool is_hardlockup(unsigned int cpu)
 	return false;
 }
 
-static unsigned long watchdog_hardlockup_kick(void)
+static void watchdog_hardlockup_kick(void)
 {
-	return atomic_inc_return(this_cpu_ptr(&hrtimer_interrupts));
+	int new_interrupts;
+
+	new_interrupts = atomic_inc_return(this_cpu_ptr(&hrtimer_interrupts));
+	watchdog_buddy_check_hardlockup(new_interrupts);
 }
 
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
@@ -195,7 +198,7 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 
 #else /* CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER */
 
-static inline unsigned long watchdog_hardlockup_kick(void) { return 0; }
+static inline void watchdog_hardlockup_kick(void) { }
 
 #endif /* !CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER */
 
@@ -449,15 +452,11 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 	struct pt_regs *regs = get_irq_regs();
 	int duration;
 	int softlockup_all_cpu_backtrace = sysctl_softlockup_all_cpu_backtrace;
-	unsigned long hrtimer_interrupts;
 
 	if (!watchdog_enabled)
 		return HRTIMER_NORESTART;
 
-	hrtimer_interrupts = watchdog_hardlockup_kick();
-
-	/* test for hardlockups */
-	watchdog_buddy_check_hardlockup(hrtimer_interrupts);
+	watchdog_hardlockup_kick();
 
 	/* kick the softlockup detector */
 	if (completion_done(this_cpu_ptr(&softlockup_completion))) {
diff --git a/kernel/watchdog_buddy.c b/kernel/watchdog_buddy.c
index fee45af2e5bd..3ffc5f2ede5a 100644
--- a/kernel/watchdog_buddy.c
+++ b/kernel/watchdog_buddy.c
@@ -72,7 +72,7 @@ void watchdog_hardlockup_disable(unsigned int cpu)
 	cpumask_clear_cpu(cpu, &watchdog_cpus);
 }
 
-void watchdog_buddy_check_hardlockup(unsigned long hrtimer_interrupts)
+void watchdog_buddy_check_hardlockup(int hrtimer_interrupts)
 {
 	unsigned int next_cpu;
 
-- 
2.41.0.rc0.172.g3f132b7071-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
