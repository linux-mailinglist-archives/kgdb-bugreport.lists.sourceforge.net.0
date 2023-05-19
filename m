Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2873C70A95C
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 20 May 2023 18:55:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q0PrG-0005Vv-JW
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 20 May 2023 16:55:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q03sD-00028X-PQ
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=02qH/DnpEiYKBFSrjaJ0Y79pipvrSaWo4CdISHdDfuc=; b=ZMgdeDD/xCgUijgD6Xk+mJsIw2
 4luwmJ1B/lMvPLkRrpPA2qhRX8ZHW354Q3VIlALkhedKqe3uSNiV96x0kCZZGF321wl5iTlK5nM4E
 ONid8+o8XF/WjkLedg+O4fyLNHmu+m+A9EknRKyYeJNfAqEnFlspqineZD/r9VdyJ/vk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=02qH/DnpEiYKBFSrjaJ0Y79pipvrSaWo4CdISHdDfuc=; b=N4MYNPqQuGzVEU0ua/6/kXG8XJ
 X1a8s+Ef0LNEWfeEwqaWxNBtuyDYw6/aWkaThHPJqQZs2zmKD9UI58tQg7EUdpiJ4iIqCqATVa0Vj
 qRzl2tN+n7/7v32U5PtsPtnG7eaEfdwMsxVkAb44+Y8u7dP/4FspzcGAsm8VRIsak13o=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q03s9-00DY9K-Nk for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:26:38 +0000
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-64d3e5e5980so636874b3a.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684517188; x=1687109188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=02qH/DnpEiYKBFSrjaJ0Y79pipvrSaWo4CdISHdDfuc=;
 b=ZLYYdC6jpInK1Iso31LARmHolQEG29hlLZTeIQfvYnMcOb4ojsWmjWTUEbXUx7QHcV
 OwTCChP4jKrVnx35jvQsKbnQzIFhagnMtccKOwx0RLztifsF4ygfVT4XIoGmZBVh/M3A
 PM8l5gB76BR3Kdb3H/iXj3mBA7xZW2USB5w64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684517188; x=1687109188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=02qH/DnpEiYKBFSrjaJ0Y79pipvrSaWo4CdISHdDfuc=;
 b=g39FD6LQgYrNp2QjgRTg07T0CHG9BXuA6XI3pMZvO8R5hV4J+A8MEnKoJonRwyqZut
 9TMg2NQqBcdEfLjckDmQhY9x8ZMRwaj3Mgd0kXV/4cxamPr5+FezLGqNucZdmOn4dQLR
 0PM95GG2hqShhVRu3k1DItScoNvcmVOh7x9xCt5sb7FIPx5K2BQIAjF8Y87I79odUoJx
 5xXgxLL19l/2cHF4/TT4tCwVlVhf8SKW1pWOGkyQqKgXLW41r/4wzBcZb5Xc00C6TZUn
 9clDA229gUaQQubhqHyy1J1+/zm4m753a2d4uLVkfitiao+/jm88whibq8QBY4ch3hzt
 vKyA==
X-Gm-Message-State: AC+VfDwTBya+WFwciXqLUjZ+CR5m0LlFZBwKHK2xcEn9YhbCrBi4/EkW
 zp/dwKId3pznrt5qAjqn36gqGb9WH9+m3hJDROY=
X-Google-Smtp-Source: ACHHUZ4VewjZvf6tgnnmMrLmNUmoTIX2MqjaMcwoqjHE7Ok2xZz+MKgk8d92NT7mvLQB9l1ZhiFZDg==
X-Received: by 2002:a17:90b:4b46:b0:253:6713:c7c2 with SMTP id
 mi6-20020a17090b4b4600b002536713c7c2mr2717286pjb.43.1684516839149; 
 Fri, 19 May 2023 10:20:39 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9b89:2dd0:d160:429d])
 by smtp.gmail.com with ESMTPSA id
 gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:20:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 19 May 2023 10:18:25 -0700
Message-ID: <20230519101840.v5.1.I8cbb2f4fa740528fcfade4f5439b6cdcdd059251@changeid>
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
 Content preview:  The real watchdog_update_hrtimer_threshold() is defined in
 kernel/watchdog_hld.c. That file is included if
 CONFIG_HARDLOCKUP_DETECTOR_PERF
 and the function is defined in that file if CONFIG_HARDLOCKUP [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q03s9-00DY9K-Nk
Subject: [Kgdb-bugreport] [PATCH v5 01/18] watchdog/perf: Define dummy
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

The real watchdog_update_hrtimer_threshold() is defined in
kernel/watchdog_hld.c. That file is included if
CONFIG_HARDLOCKUP_DETECTOR_PERF and the function is defined in that
file if CONFIG_HARDLOCKUP_CHECK_TIMESTAMP.

The dummy version of the function in "nmi.h" didn't get that quite
right. While this doesn't appear to be a huge deal, it's nice to make
it consistent.

It doesn't break builds because CHECK_TIMESTAMP is only defined by
x86 so others don't get a double definition, and x86 uses perf lockup
detector, so it gets the out of line version.

Fixes: 7edaeb6841df ("kernel/watchdog: Prevent false positives with turbo modes")
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- Add Nicholas's explanation of why this didn't break builds.
- watchdog_hardlockup_perf.c => kernel/watchdog_hld.c in description.

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
2.40.1.698.g37aff9b760-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
