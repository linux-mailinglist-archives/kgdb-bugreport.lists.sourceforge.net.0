Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 811ED6F78D3
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 00:14:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puhDx-0005Ne-V8
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 04 May 2023 22:14:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puhDw-0005NX-Jr
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q1z7mPfi+9kXcDKqT71sJAQGBxu7RyXh4JV2wfNk/es=; b=AF3PYjiZggvkkRrYF9NkNsTzta
 PdtYHWjynaIicGOkqDulsUwtWK+czwgqJl1bKJ2iDtdoyb+pV05POSlho1LBbEM4DuipTp0rhNg0+
 JOzTbaG8WvomMLz61CedWQ2ELErFgeYFRinLIJjrHYgfFQCbHS8/XSMMhGjTKXRdKuwU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q1z7mPfi+9kXcDKqT71sJAQGBxu7RyXh4JV2wfNk/es=; b=TW4TtQ0HVTtlBgWoGDcWz47rya
 2KzwHW4r1WbU55CAX0yHHv2TxtFQPUZ7gtHGZ94OxouOdRusnu0kP0FnqD31xyPDVTtNON3TxfEKX
 9kVD5xm2FTWEUgUZ2cZwBIcp7E+gjLHm1FTPQ8CLQ8dWrfJAI+ro1dGNqnmLVAZ7+Mzs=;
Received: from mail-pg1-f175.google.com ([209.85.215.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puhDw-0004Sb-8y for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:14:52 +0000
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-51f597c975fso936895a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683238486; x=1685830486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q1z7mPfi+9kXcDKqT71sJAQGBxu7RyXh4JV2wfNk/es=;
 b=nIjoIkW3p03FUu+3GxCcNYkSzcj/lDeOENMDPI4fWfUDdG7bT08Sb+dJlzfLePSU5E
 mVGDvKwII6sScPmLx8Iom+7xMBMbGZTte6pLYZwgEDCl0uBaz3UERsDasZ//5a7Rt8ID
 KeoANLYDUm1QrguA2OgwX0v7dqA356HU4O/WQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683238486; x=1685830486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q1z7mPfi+9kXcDKqT71sJAQGBxu7RyXh4JV2wfNk/es=;
 b=ZuNfxOA0XjU5V5+51Bq3HQMrvbRxU84IFgj3CuMY5ASgTBIaY0AuuCF6Emdit5Q5V2
 i/TArCMZh1wCIM3vidR1TI70m/PKogAXrfUWRU76Kv1riSY2KaI2MX8UahyDDnrlwm6U
 EdjRBK82hcYx3/kdCSHnM7yHQaZx0F1R9TUiMhUSrID7j5jef6dq/zEgFz78IK3fvQFg
 2jwy8VpbGl08Z+jVktW7CCzmJZnAWGi5tEJa1IjvTNk8qfzkAx2slRprFrrqHvEBUZjS
 ujw8BLxF8MUg62UxaXLFVlaUSTY+vrSw/rw3UZjtf6EupMHsqn8nR/vU8NQW1PZXjOkI
 bQ2g==
X-Gm-Message-State: AC+VfDxhovGc3LRUP1uHR6TpBo5QSjXbhEtkp62Sw+l1+aZhVAO59XY4
 hyubC/+JxKFv9QkyRQVzTWa6PQ==
X-Google-Smtp-Source: ACHHUZ6srX3RLh0nySv1vg2bjN5I3jzdANZ2xcZbCkodBOlfCv7QBn4Vf3SuhK63bPEngQxlNTdd2A==
X-Received: by 2002:a05:6a20:7f8f:b0:f8:ac26:b899 with SMTP id
 d15-20020a056a207f8f00b000f8ac26b899mr4830221pzj.0.1683238486722; 
 Thu, 04 May 2023 15:14:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
 by smtp.gmail.com with ESMTPSA id
 g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 15:14:46 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  4 May 2023 15:13:33 -0700
Message-ID: <20230504151100.v4.1.I8cbb2f4fa740528fcfade4f5439b6cdcdd059251@changeid>
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
 Content preview:  The real watchdog_update_hrtimer_threshold() is defined in
 watchdog_hardlockup_perf.c. That file is included if
 CONFIG_HARDLOCKUP_DETECTOR_PERF
 and the function is defined in that file if CONFIG_HARDL [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.175 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.175 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puhDw-0004Sb-8y
Subject: [Kgdb-bugreport] [PATCH v4 01/17] watchdog/perf: Define dummy
 watchdog_update_hrtimer_threshold() on correct config
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

The real watchdog_update_hrtimer_threshold() is defined in
watchdog_hardlockup_perf.c. That file is included if
CONFIG_HARDLOCKUP_DETECTOR_PERF and the function is defined in that
file if CONFIG_HARDLOCKUP_CHECK_TIMESTAMP.

The dummy version of the function in "nmi.h" didn't get that quite
right. While this doesn't appear to be a huge deal, it's nice to make
it consistent.

Fixes: 7edaeb6841df ("kernel/watchdog: Prevent false positives with turbo modes")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("Define dummy watchdog_update_hrtimer_threshold() ...") new for v4.

 include/linux/nmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 048c0b9aa623..771d77b62bc1 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -197,7 +197,7 @@ u64 hw_nmi_get_sample_period(int watchdog_thresh);
 #endif
 
 #if defined(CONFIG_HARDLOCKUP_CHECK_TIMESTAMP) && \
-    defined(CONFIG_HARDLOCKUP_DETECTOR)
+    defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
 void watchdog_update_hrtimer_threshold(u64 period);
 #else
 static inline void watchdog_update_hrtimer_threshold(u64 period) { }
-- 
2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
