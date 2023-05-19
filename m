Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7E070A95B
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 20 May 2023 18:55:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q0PrC-0004cJ-SN
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 20 May 2023 16:55:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q03tT-00085X-NU
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FtWewuf5QmwEoMrp2heDkMSCLJmOGom4IGUit5Qgo0E=; b=TjOCtFH532ajBvto982avkQfd9
 bvlJpYvQwIJjTOykHFUN6R9YAWPWVVRJL9rW52iZ2QLHW21OU2rmnOJDP6gSuPnECDBW8JCXTrPkf
 /4paVcApHKSA4LBR0tAfDLM+3evr3YamxxXIexmbXLR83f23bwXv0t9Avqb/N4Q4XwEY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FtWewuf5QmwEoMrp2heDkMSCLJmOGom4IGUit5Qgo0E=; b=ZrUMFmS836ggvS2eHz4yywSdJz
 C54gRwwlNiJBAK2DCLcTr3fMvz3cKMzgtJyJZZKCA3CbWfj9SYhN8Zj5R4MJEDIyckBZ0z80UHwpS
 HtUCeoo+4HOePifJ9EfWH+j3LcY2F1gd0hywG/KmR74KzKktu6IQayE+9LaBAOd8TSko=;
Received: from mail-qt1-f169.google.com ([209.85.160.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q03tR-00DYBn-VB for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:27:55 +0000
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-3f529239e4aso35408481cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684517268; x=1687109268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FtWewuf5QmwEoMrp2heDkMSCLJmOGom4IGUit5Qgo0E=;
 b=JFwUFn+pO9NOHfkFxQHdT4b2HPS89MP1rp0oW6q5ELitlWYKiFJFKrmkLy0xxLreq0
 IZlTNDtUvOOj141GauiIV4Yp/77ZNaFjKHikllgpJR2xGe+VYM9jEmV/VK5MTP4Emmil
 yL//9d4VpNMMtw75adK8H0/m+ZqvFt/ofladQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684517268; x=1687109268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FtWewuf5QmwEoMrp2heDkMSCLJmOGom4IGUit5Qgo0E=;
 b=kwwikTIROgFDYJV+znhQSKHBYw3vuZA2eaucCbeWaeNsA3hHqrMCvMgsVewNs3Q0jE
 /oqbw1Tz70w7oGF7w+NK9BZ7pmPkW9ptGC9iLESojvF6DP/QUMlLyx6LN5OZyyqY/qHI
 gZbVztingKgBzAESreMACbTWAp7iDgu2MNG/EWDn2RWwaTynZBIuQHtN7y0BwqrZunFr
 kUjmSdwQ1+NuH0g3ldCy9Uvp5x5QBj9yyJTDu6PEtvwEa1Rwsqo+c9rjc3q5lqyKNgpa
 Y+oJG78pkGPMzxse51YGR0OeJ6V/eSq7CT8RUPJTez2rGhQAc3gMLPcHMJiX9PohRFOr
 tLWg==
X-Gm-Message-State: AC+VfDyMe/rYI1DoGUDu6yVSOCsd5ryN07p7Uj6ZEqAzsNmkyWckbzKe
 s7n31wJ4nQT16KVZchWMjdCclemvMQbxQuZXckY=
X-Google-Smtp-Source: ACHHUZ7LqONQqbo1f32uROMOmBD1YwxsC0hUaPEyZAYzC5eD1qH0xMLrKy1PKFruL4ixUcNA0i2quA==
X-Received: by 2002:a17:90a:8b0e:b0:253:8796:3322 with SMTP id
 y14-20020a17090a8b0e00b0025387963322mr1959543pjn.27.1684516851906; 
 Fri, 19 May 2023 10:20:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9b89:2dd0:d160:429d])
 by smtp.gmail.com with ESMTPSA id
 gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:20:51 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 19 May 2023 10:18:29 -0700
Message-ID: <20230519101840.v5.5.I654063e53782b11d53e736a8ad4897ffd207406a@changeid>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.169 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q03tR-00DYBn-VB
Subject: [Kgdb-bugreport] [PATCH v5 05/18] watchdog/perf: Ensure CPU-bound
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
 ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, christophe.leroy@csgroup.eu,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
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

(no changes since v4)

Changes in v4:
- Pulled ("Ensure CPU-bound context when creating ...") into my series for v4.

 kernel/watchdog_hld.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_hld.c
index 1e8a49dc956e..2125b09e09d7 100644
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
2.40.1.698.g37aff9b760-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
