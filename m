Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A333713197
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 27 May 2023 03:42:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q2iwv-0001tk-Or
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 27 May 2023 01:42:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q2iwt-0001te-4R
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4pTZ8PdJlA6i+SWNusBTmTzOcCRT41PhrexiQIb/AKs=; b=dja4vOB+3c5biZBRMineW7bRxp
 rJhvQ+wEwBZu8l5v+QgUiX6JwgJ1Zf0CGmi2s1ybKmBd5/2Yah5iSqpOUQlIpm66MfRBBj6DWxdPL
 sG1WVmU/7CrTSMH7t9cTKX9iZmP/18daKnpF+wT7lTVFpyi35Wx9geCNw3HbYnjY8JAQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4pTZ8PdJlA6i+SWNusBTmTzOcCRT41PhrexiQIb/AKs=; b=i29z09gpNYmcSTdut43WJLqBD+
 hL8McMR3c7/gZlhxladgcWtX6lfjaNErDQ9ti4MbQhOx58zUgnpiWq1fVC4POLh3K3xq2VitHC4Wi
 wMEKXHrZr9fABkUEELKQghYQQTHbfs3L1fjRqCrIiDG3wqJLla9mVZzWqhChS6NOlov8=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q2iwt-003o2E-3K for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:27 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-64d2e8a842cso1214034b3a.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 May 2023 18:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685151741; x=1687743741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pTZ8PdJlA6i+SWNusBTmTzOcCRT41PhrexiQIb/AKs=;
 b=dGhxmHD/CSkrIECymGSZJgjulMjULoIls2yt2guqhtavg8UVpzegqrUgkex1Az5eH9
 7o8tE1sfBCLwp5jGYATbBDjOwYfBLu2wLAWmL4Fu2votApVdW9ieYsPlWvXbTAoEZCRx
 IE9pmuxtKBeT5vr2dhEgDDxn0u6fSztfVGgQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685151741; x=1687743741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4pTZ8PdJlA6i+SWNusBTmTzOcCRT41PhrexiQIb/AKs=;
 b=PvCV6ue0sbnp7B4HjooBz3d3I2LvVWUItdVpGMyY9lm/wFPmaKtOFXCJf+RvsX0j6t
 ptE2QySfIhu/zgD3ij2v0N4/3jpqTzmVWbs1Q4ZhlophtvGgLXqoHpRYRB1Rg1VDO39D
 3aMmXcGHUj1+no90/+66AwP/FkT0qfiGzVXaIV4V05mQphtiKtG/XeLCRJTmEOasfyaX
 gy8avGLE5TIAs8VFhVsz5czaoecEwB0n/Zg1XW6XN80xtgaLXJdFuH7SJx8fRDsZIcVI
 9dflEhm3uqV/dkf1wQc5XEC4pXVyvpJP7DOowAPIkdyioRnRQqxUjA7lqmUVBPD72KC8
 DGvg==
X-Gm-Message-State: AC+VfDwy9srWbzgp2kOgvcxAXY4/tShj14e1VqPDsRP3VCJoQgh26LI+
 PR9pLV2lFFT3u3MiI4dPrFjj6Q==
X-Google-Smtp-Source: ACHHUZ5UUsITWZmTwpdRkqyumpngtWqGIdFge6BCERd9qHLdsT3GhYY3Nylr4mH6Rilg/sSJVj2BfQ==
X-Received: by 2002:a05:6a00:139c:b0:64c:ae1c:33ac with SMTP id
 t28-20020a056a00139c00b0064cae1c33acmr7231420pfg.25.1685151741546; 
 Fri, 26 May 2023 18:42:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4015:7255:c79a:26d7])
 by smtp.gmail.com with ESMTPSA id
 x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 18:42:20 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 26 May 2023 18:41:33 -0700
Message-ID: <20230526184139.3.I660e103077dcc23bb29aaf2be09cb234e0495b2d@changeid>
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
 Content preview: In the patch ("watchdog/hardlockup: add a "cpu" param to
 watchdog_hardlockup_check()")
 there was no reason to use raw_cpu_ptr(). Using this_cpu_ptr() works fine.
 Suggested-by: Petr Mladek <pmladek@suse.com> Signed-off-by: Douglas Anderson
 <dianders@chromium.org> --- 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.169 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2iwt-003o2E-3K
Subject: [Kgdb-bugreport] [PATCH 03/10] watchdog/hardlockup: Don't use
 raw_cpu_ptr() in watchdog_hardlockup_kick()
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

In the patch ("watchdog/hardlockup: add a "cpu" param to
watchdog_hardlockup_check()") there was no reason to use
raw_cpu_ptr(). Using this_cpu_ptr() works fine.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/watchdog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 62230f5b8878..32dac8028753 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -133,7 +133,7 @@ static bool is_hardlockup(unsigned int cpu)
 
 static unsigned long watchdog_hardlockup_kick(void)
 {
-	return atomic_inc_return(raw_cpu_ptr(&hrtimer_interrupts));
+	return atomic_inc_return(this_cpu_ptr(&hrtimer_interrupts));
 }
 
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
-- 
2.41.0.rc0.172.g3f132b7071-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
