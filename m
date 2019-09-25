Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F313BE650
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 25 Sep 2019 22:28:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iDDtU-0003wK-92
	for lists+kgdb-bugreport@lfdr.de; Wed, 25 Sep 2019 20:28:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iDDtT-0003wC-Re
 for kgdb-bugreport@lists.sourceforge.net; Wed, 25 Sep 2019 20:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CQLYUORcfotgaKqy5gkXc5kVZJb5dGrYga+46jw612E=; b=I2/uWCeYMgLPrJVGcs5IjoUT0a
 pCQpuBXBusJJF2oPaIyLBEqQ+uNf1eKFZwAkYqPcrbhd45Kp1/vre6ldKt2WWUtZhVAljvu1BS6G1
 Aoi6E+r/s01GsauN3Xz8gK0rsLC3gfP1ZNV9Mo4o3X9M/W6m4BfE5yDetBxGoSql4g2U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CQLYUORcfotgaKqy5gkXc5kVZJb5dGrYga+46jw612E=; b=X/Zld1ZkzpfzI+I/pNIVmwf97P
 z9l35hqdYj4jZUjL+WUp7e59tEJkR1YQuUUkpjgFLFoeNOJSqKJ7vzl8GVc/WQAcn2dtdY86u72e2
 gAzdyOZgEfmMIsxoEpH/Au6n6UBQXdVeYhhQr2Dhnz/7mJoWDoxJeJGa5rcESvkfPX44=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iDDtR-006hmF-OD
 for kgdb-bugreport@lists.sourceforge.net; Wed, 25 Sep 2019 20:28:11 +0000
Received: by mail-pf1-f194.google.com with SMTP id y72so79891pfb.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 25 Sep 2019 13:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CQLYUORcfotgaKqy5gkXc5kVZJb5dGrYga+46jw612E=;
 b=BBRlV88bVISU676nmRF0kHVZdbXHig0dn9rIjsZ8a0RiJ8C7mEzWYP6UYHuj4l6KeY
 M8EMwHVLwnCKr6L4uqSHsH4P7cYEucUlq4v1CPfV7QjSl0nBvxmnM5Hr3knERGUN+v+T
 iDStwC0hgjriwDEOj/1GoS+dVq0GqUviNbZq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CQLYUORcfotgaKqy5gkXc5kVZJb5dGrYga+46jw612E=;
 b=dbcCQsHeQiHLR+FimpKY27sugRPTusU0ob+3fn7f1fedM05ihXXYwKljx3o4GhIlYs
 NPEKGs8NiC9Yytm+tEZB60NTNJWz45SJoyCCs3hrpR84rqXniBPn/4LkJdOh89cjmFaZ
 FOWEbDa2gs+j7848oGMqWkkLkIpaAf1N9IYS8jvv0QuyYADxxjnx9GLFT/UAcIEnnV/A
 MASmhbLpVHLFDJMA7xgSaSEUoTHS09JvKNKSJA0W+vNqrIa3INd+my44K43Xgd8ryKpd
 8h1XftqRqajsOz+q7dL7cbpCtb8AumCrYFJJzTFydajcGXKy/5amr7he+KoADYzPYDA3
 8UXw==
X-Gm-Message-State: APjAAAWhLKRr7GUrGp6pcCjfSsu1FXb/9RkaxXAiLmJyfWS3JPZqtvj1
 t0sfN6vztEj3bxGd2rxi0pwcEESJ0+0=
X-Google-Smtp-Source: APXvYqwJ6pHdDAlsDr5RKFXS0cDGb0ZF1UKcTlt+5NRLmu4on6vgnFNUO2amx7Cb+kq88ANcYDP1LQ==
X-Received: by 2002:a62:3c1:: with SMTP id 184mr317726pfd.209.1569441771927;
 Wed, 25 Sep 2019 13:02:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d76sm458113pga.80.2019.09.25.13.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 13:02:51 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 25 Sep 2019 13:02:19 -0700
Message-Id: <20190925125811.v3.3.Id33c06cbd1516b49820faccd80da01c7c4bf15c7@changeid>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
In-Reply-To: <20190925200220.157670-1-dianders@chromium.org>
References: <20190925200220.157670-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iDDtR-006hmF-OD
Subject: [Kgdb-bugreport] [PATCH v3 3/4] kdb: Fix "btc <cpu>" crash if the
 CPU didn't round up
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

I noticed that when I did "btc <cpu>" and the CPU I passed in hadn't
rounded up that I'd crash.  I was going to copy the same fix from
commit 162bc7f5afd7 ("kdb: Don't back trace on a cpu that didn't round
up") into the "not all the CPUs" case, but decided it'd be better to
clean things up a little bit.

This consolidates the two code paths.  It is _slightly_ wasteful in in
that the checks for "cpu" being too small or being offline isn't
really needed when we're iterating over all online CPUs, but that
really shouldn't hurt.  Better to have the same code path.

While at it, eliminate at least one slightly ugly (and totally
needless) recursive use of kdb_parse().

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Patch ("kdb: Fix "btc <cpu>" crash if the CPU...") new for v3.

Changes in v2: None

 kernel/debug/kdb/kdb_bt.c | 61 ++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 27 deletions(-)

diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
index 120fc686c919..d9af139f9a31 100644
--- a/kernel/debug/kdb/kdb_bt.c
+++ b/kernel/debug/kdb/kdb_bt.c
@@ -101,6 +101,27 @@ kdb_bt1(struct task_struct *p, unsigned long mask, bool btaprompt)
 	return 0;
 }
 
+static void
+kdb_bt_cpu(unsigned long cpu)
+{
+	struct task_struct *kdb_tsk;
+
+	if (cpu >= num_possible_cpus() || !cpu_online(cpu)) {
+		kdb_printf("WARNING: no process for cpu %ld\n", cpu);
+		return;
+	}
+
+	/* If a CPU failed to round up we could be here */
+	kdb_tsk = KDB_TSK(cpu);
+	if (!kdb_tsk) {
+		kdb_printf("WARNING: no task for cpu %ld\n", cpu);
+		return;
+	}
+
+	kdb_set_current_task(kdb_tsk);
+	kdb_bt1(kdb_tsk, ~0UL, false);
+}
+
 int
 kdb_bt(int argc, const char **argv)
 {
@@ -161,7 +182,6 @@ kdb_bt(int argc, const char **argv)
 	} else if (strcmp(argv[0], "btc") == 0) {
 		unsigned long cpu = ~0;
 		struct task_struct *save_current_task = kdb_current_task;
-		char buf[80];
 		if (argc > 1)
 			return KDB_ARGCOUNT;
 		if (argc == 1) {
@@ -169,35 +189,22 @@ kdb_bt(int argc, const char **argv)
 			if (diag)
 				return diag;
 		}
-		/* Recursive use of kdb_parse, do not use argv after
-		 * this point */
-		argv = NULL;
 		if (cpu != ~0) {
-			if (cpu >= num_possible_cpus() || !cpu_online(cpu)) {
-				kdb_printf("no process for cpu %ld\n", cpu);
-				return 0;
-			}
-			sprintf(buf, "btt 0x%px\n", KDB_TSK(cpu));
-			kdb_parse(buf);
-			return 0;
-		}
-		kdb_printf("btc: cpu status: ");
-		kdb_parse("cpu\n");
-		for_each_online_cpu(cpu) {
-			void *kdb_tsk = KDB_TSK(cpu);
-
-			/* If a CPU failed to round up we could be here */
-			if (!kdb_tsk) {
-				kdb_printf("WARNING: no task for cpu %ld\n",
-					   cpu);
-				continue;
+			kdb_bt_cpu(cpu);
+		} else {
+			/*
+			 * Recursive use of kdb_parse, do not use argv after
+			 * this point.
+			 */
+			argv = NULL;
+			kdb_printf("btc: cpu status: ");
+			kdb_parse("cpu\n");
+			for_each_online_cpu(cpu) {
+				kdb_bt_cpu(cpu);
+				touch_nmi_watchdog();
 			}
-
-			sprintf(buf, "btt 0x%px\n", kdb_tsk);
-			kdb_parse(buf);
-			touch_nmi_watchdog();
+			kdb_set_current_task(save_current_task);
 		}
-		kdb_set_current_task(save_current_task);
 		return 0;
 	} else {
 		if (argc) {
-- 
2.23.0.351.gc4317032e6-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
