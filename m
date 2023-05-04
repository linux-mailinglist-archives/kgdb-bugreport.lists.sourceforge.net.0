Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCBB6F790B
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 00:23:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puhLv-0004nn-Jq
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 04 May 2023 22:23:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puhLu-0004nh-HB
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RmIxJPekTd3YSHhbOlyX0tABIcXrA8wUlcyJjL8J4yQ=; b=Mi0LFBlB43/L2g8WSgp6kWoKne
 wBzzSpXjS7/pjIXUujiFLkBP6KSEegKAiOg6uZN9u3rfe5wmtgI0TAGgWnWGP3XAEdGD5ReKgUxKX
 +Yi/wNOXA+oXvabFcWdcvBRnSyKwUhtAbsKopSiuCYeziNAoLnPtnhCVmjDKAzp9/dpY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RmIxJPekTd3YSHhbOlyX0tABIcXrA8wUlcyJjL8J4yQ=; b=mGDGs/I2vBBw+DoYJS7q0cb0NQ
 H7YYdxz4qiFkwHB3G7pdpermlI96tvXK8n4mLXul0aKMbYoO90bbZeznW1bYJ5SFLC3AirQrL02OM
 fLxMcObg6HHxuUT4H4Hm4iCjhPVQPiHHdsURkAnDjeZ0bMttCuAZjV7NQMdZ5PFIiQeg=;
Received: from mail-yw1-f172.google.com ([209.85.128.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puhLu-0005YG-LV for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:23:07 +0000
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-55a00da4e53so18530357b3.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683238981; x=1685830981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RmIxJPekTd3YSHhbOlyX0tABIcXrA8wUlcyJjL8J4yQ=;
 b=HMtTuiFY87oVgnjVOkejdm6lw1DqMvvN0yAWdGAbvWDMUqjo18cNmkqHoWgCbe5Yi+
 COyoeDGB8N8rjEl67s126hJGgs7TYWowyj1A3Biuj2nj2AdUYsDJr6WviJsrwrnfJWag
 WtrkWQUKsHB4CAeC71UZ96RvrK+0GYnAOA2fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683238981; x=1685830981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RmIxJPekTd3YSHhbOlyX0tABIcXrA8wUlcyJjL8J4yQ=;
 b=cvqmlYvvcb/wyOGuz5be8kpRM3WqubCRBdFiKIKF/VFjuJN+mHTSm+QClpu1ZeNJIa
 0JH1Hfy3/v3PJn4PN4rT5o6IDg3jlYurRFNbvLN18dEYSdQYC2CY+vgLaUnkXPuPDeN+
 5RFAkdhI95rsA5phH34RSs3795adV2ENo3BbpeuwbtXms29AK3WYVBzIb1ofwb9lD1AG
 rCv7cYZEmwM0dHRlmYGs7vw2GHbs3UIa1dVdHdw6DcIAOvD4PulxdW134BYCYDgezI1B
 DTWV3ACfmnuNlaPELnr+/B61Dr5+3nNq6kwlNS55897ioLRnyYAER+BD1mj4sU90HMaF
 iEDQ==
X-Gm-Message-State: AC+VfDwxT59nNITm7/lAVGRnG+2BP7muHscWghaXzXoWzN6EVVovCej7
 wZeIP4Y5ofEup6bYC2tdkkISP6rQ2tqsW0YyhwU=
X-Google-Smtp-Source: ACHHUZ4OEU35K3+sSCEyiMl0QxsV/WrmtTjX4ONPjO2qeVS0NTr5bhnPpyCKmHdt3oXalTjYAknA7Q==
X-Received: by 2002:a05:6a00:1881:b0:63b:8afe:a4dc with SMTP id
 x1-20020a056a00188100b0063b8afea4dcmr5365992pfh.30.1683238502557; 
 Thu, 04 May 2023 15:15:02 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
 by smtp.gmail.com with ESMTPSA id
 g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 15:15:01 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  4 May 2023 15:13:38 -0700
Message-ID: <20230504151100.v4.6.Ice803cb078d0e15fb2cbf49132f096ee2bd4199d@changeid>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <20230504221349.1535669-1-dianders@chromium.org>
References: <20230504221349.1535669-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The code currently in "watchdog_hld.c" is for detecting
 hardlockups
 using perf, as evidenced by the line in the Makefile that only compiles this
 file if CONFIG_HARDLOCKUP_DETECTOR_PERF is defined. Ren [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.172 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puhLu-0005YG-LV
Subject: [Kgdb-bugreport] [PATCH v4 06/17] watchdog/perf: Rename
 watchdog_hld.c to watchdog_perf.c
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

The code currently in "watchdog_hld.c" is for detecting hardlockups
using perf, as evidenced by the line in the Makefile that only
compiles this file if CONFIG_HARDLOCKUP_DETECTOR_PERF is
defined. Rename the file to prepare for the buddy hardlockup detector,
which doesn't use perf.

It could be argued that the new name makes it less obvious that this
is a hardlockup detector. While true, it's not hard to remember that
the "perf" detector is always a hardlockup detector and it's nice not
to have names that are too convoluted.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("Rename watchdog_hld.c to watchdog_perf.c") new for v4.

 kernel/Makefile                            | 2 +-
 kernel/{watchdog_hld.c => watchdog_perf.c} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename kernel/{watchdog_hld.c => watchdog_perf.c} (99%)

diff --git a/kernel/Makefile b/kernel/Makefile
index 10ef068f598d..406ccccc4dd3 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -91,7 +91,7 @@ obj-$(CONFIG_FAIL_FUNCTION) += fail_function.o
 obj-$(CONFIG_KGDB) += debug/
 obj-$(CONFIG_DETECT_HUNG_TASK) += hung_task.o
 obj-$(CONFIG_LOCKUP_DETECTOR) += watchdog.o
-obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF) += watchdog_hld.o
+obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF) += watchdog_perf.o
 obj-$(CONFIG_SECCOMP) += seccomp.o
 obj-$(CONFIG_RELAY) += relay.o
 obj-$(CONFIG_SYSCTL) += utsname_sysctl.o
diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_perf.c
similarity index 99%
rename from kernel/watchdog_hld.c
rename to kernel/watchdog_perf.c
index 96b717205952..c3d8ceb149da 100644
--- a/kernel/watchdog_hld.c
+++ b/kernel/watchdog_perf.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Detect hard lockups on a system
+ * Detect hard lockups on a system using perf
  *
  * started by Don Zickus, Copyright (C) 2010 Red Hat, Inc.
  *
-- 
2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
