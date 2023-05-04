Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2906F790C
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 00:23:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puhMD-0005Sg-FJ
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 04 May 2023 22:23:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puhMC-0005Sa-60
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+7chyR54aRty46RzcCdMbqi2QxR3fWS0cburZo/9gxI=; b=QwSb6ymuSOD0DI6PgnDSEPBxOz
 8/dmxmR6vvmFxCsmahmN3UP/AzmtoiCDuBLaxkdCj/aNFQ7xlHnNyRbKxNAA6deB4WKWMIRDbONK7
 akfE6P+zSuHLHC6vqUtnMOpot310fnXsN2Nq/V8fC4MF2Dal5W8q+eIJTs1tKSXW4Z3g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+7chyR54aRty46RzcCdMbqi2QxR3fWS0cburZo/9gxI=; b=R4m3CuReLlw/CyRVFTKex3otxV
 pKZ0Cs4JU6BXoJxEeGu03SY6YhDZsEYm7k2NMv0RiFfy6G/0+RZGjTIT2SqYQ34CCdaYHv98iqBxG
 tPh6BkbGtmd+ZDkeIcxvM2VEWizPmG2hiLDPmTMJivEeOZL2EVI/wC5oigbH0eOmSyI8=;
Received: from mail-yw1-f171.google.com ([209.85.128.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puhMA-00ET7d-4h for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:23:23 +0000
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-55aa1da9d4aso18300257b3.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683238996; x=1685830996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+7chyR54aRty46RzcCdMbqi2QxR3fWS0cburZo/9gxI=;
 b=WLZHqofd+oBu68AUTvcCCco6PkQ8f6svIjzCkZa0vdD4dqY+1cO4wD+D/5V5LHzeRR
 SPvaA8Y2mace5B7qNvm72fvAGfpIgZpoyIeTeoDZl1jH/yfUjVqsXCFVUXZp11Rw+VMF
 F9r/vJTkiyOLyasR1RT6aQhcNOnwMdB7IXH2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683238996; x=1685830996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+7chyR54aRty46RzcCdMbqi2QxR3fWS0cburZo/9gxI=;
 b=NEJbgxIJPL2VhgF21NdT/Hz9LnKo/IjcdFnMUo60W/oE2hGS+ZR/K5g4CcGu7z4aXC
 QY2fUS0rpnpPb0/bXcYTjJcetGDMN8EbP23obIjJCdU6y4sWEKeHUCngx//BWd2+QtCF
 ay8HteWcqkRun6SsMuI0+RjKOIDXXiDhL0AfL7lT95Dh86pvdglyBfFCq5oIkP4C15KN
 GQlgFxBOXKzQBZSgrBREIlh+hCcDb7S1xx2CiETb4RVhwONOSEXJIVB9PKOo1x7X4kni
 OZA++O/VGbiXuvWHBX2peCTSMwROhISOeVF1zD2/JV1FoSEwt+gKWbzOhy30afYG8scu
 +0qg==
X-Gm-Message-State: AC+VfDzpTrURwtiujEuSs/CQ3W/J5cW/3oaMLITlwUqjmlFKcGjoXJ/q
 WZi/1RLKq09g485DVNsOVJfeGxPr6IFI3wNo5NM=
X-Google-Smtp-Source: ACHHUZ6RrkuuKPBgTlGYVBYmU7JHppwAnr7B5nmjdOCKHM4QBI81WKafubaC+FF4dnrAufHF9KP6jQ==
X-Received: by 2002:a05:6a00:2e06:b0:62d:8376:3712 with SMTP id
 fc6-20020a056a002e0600b0062d83763712mr4427628pfb.28.1683238496089; 
 Thu, 04 May 2023 15:14:56 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
 by smtp.gmail.com with ESMTPSA id
 g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 15:14:55 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  4 May 2023 15:13:36 -0700
Message-ID: <20230504151100.v4.4.I654063e53782b11d53e736a8ad4897ffd207406a@changeid>
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
 Content preview: From: Pingfan Liu <kernelfans@gmail.com>
 hardlockup_detector_event_create()
 should create perf_event on the current CPU. Preemption could not get disabled
 because perf_event_create_kernel_counter() allocates memory. Instead, the
 CPU locality [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.171 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puhMA-00ET7d-4h
Subject: [Kgdb-bugreport] [PATCH v4 04/17] watchdog/perf: Ensure CPU-bound
 context when creating hardlockup detector event
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

From: Pingfan Liu <kernelfans@gmail.com>

hardlockup_detector_event_create() should create perf_event on the
current CPU. Preemption could not get disabled because
perf_event_create_kernel_counter() allocates memory. Instead,
the CPU locality is achieved by processing the code in a per-CPU
bound kthread.

Add a check to prevent mistakes when calling the code in another
code path.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Co-developed-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I yanked this patch from the mailing lists [1] into my series just to
make it easier to avoid conflicts between my series and the one adding
the arm64 perf hardlockup detector, in case someone wanted to test
them both together. This is a nice cleanup and could land together
with the rest of my series if that makes sense.

I changed the patch prefix to match others in my series.

[1] https://lore.kernel.org/r/20220903093415.15850-4-lecopzer.chen@mediatek.com/

Changes in v4:
- Pulled ("Ensure CPU-bound context when creating ...") into my series for v4.

 kernel/watchdog_hld.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_hld.c
index 247bf0b1582c..96b717205952 100644
--- a/kernel/watchdog_hld.c
+++ b/kernel/watchdog_hld.c
@@ -165,10 +165,16 @@ static void watchdog_overflow_callback(struct perf_event *event,
 
 static int hardlockup_detector_event_create(void)
 {
-	unsigned int cpu = smp_processor_id();
+	unsigned int cpu;
 	struct perf_event_attr *wd_attr;
 	struct perf_event *evt;
 
+	/*
+	 * Preemption is not disabled because memory will be allocated.
+	 * Ensure CPU-locality by calling this in per-CPU kthread.
+	 */
+	WARN_ON(!is_percpu_thread());
+	cpu = raw_smp_processor_id();
 	wd_attr = &wd_hw_attr;
 	wd_attr->sample_period = hw_nmi_get_sample_period(watchdog_thresh);
 
-- 
2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
