Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B80F70A95D
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 20 May 2023 18:55:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q0PrG-0004dC-W0
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 20 May 2023 16:55:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q03u4-00086C-Rq
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dNeu6vyPdP07ZkKg14nXq7JlkRTws6KPwBPqf0mDzVI=; b=aLxlkr3K7w/INOpLW7d1Pw9K2P
 HiAqX31rLNEOF4MgQs92keEj94lSasxdkcjx00+3M+VE5JRbFWwXaSmlUPbQkm9cOq6fF4lnnI90k
 1UOqzACyRQQL4B81gAtEpoD4C0lgiAdBb5sQGI6NwvcmJlT4VPf+WElU8IxfcY8P8ThI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dNeu6vyPdP07ZkKg14nXq7JlkRTws6KPwBPqf0mDzVI=; b=U5a1iaY6ZEAKIez/ZMfe0bM3+P
 va+QfeZrD0thWwknbSCVR0ZnrNyIucVDGLhIKASjEQ8cI6JHgNuN5GsoCPMTUe5NeKj0Og99wRstt
 xAI8K8y7V1S3wtOeKMYU+i4Ql54tuBm91/Q3o95S7cnO6ay8DIMcUjIpFHxaNRVLpSA8=;
Received: from mail-yb1-f174.google.com ([209.85.219.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q03u1-0007Mr-TV for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:28:32 +0000
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-ba827c74187so4903078276.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684517304; x=1687109304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dNeu6vyPdP07ZkKg14nXq7JlkRTws6KPwBPqf0mDzVI=;
 b=VudTycovmcO8r5+Wsk1BzU4Jkozuzbfxk6Y2Y0pe0v5EWb8rANX8Z66fZinAjaCJZd
 vLLfSicggHknQwUf/6KW7shOyf0cJF3DChmAq2n+dKDdy7FmUAp93ooeCP5flA4ftDx4
 JBrkwVtoJgsVbmlCFP+90RqqXpsh9QcyWUQiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684517304; x=1687109304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dNeu6vyPdP07ZkKg14nXq7JlkRTws6KPwBPqf0mDzVI=;
 b=HMicbfeijFdiLAbKNcqWN1QsxEUj1c1pavlLAiD7KF7QLmguGM0wWK4c2XBmn/czeo
 5L58luO2Nlw/plX0CF7d7QC48CZorfAuGACh0HFEhGP2FUw1RCkyfuhJHw4vPV77Kl0g
 uy0H+zeM3MO/qfBxgoUEoJRd7QWhgdVpIPENSywQxM4NNOIBPQBXoLpBxE/oeYT0EzO/
 Ug0vxN6cjmiTL28K2dLcdrDl9rkCJqaQUreHSym90e6ZBvfMbKVBxGgjQQ+6IEBTLLq+
 BJKJbEm/EhHxsnXPWW6WTgBdV5wPFQY7cCv+w8Fgur7t8bMgnEIZvrtBgugBx7EgtXsL
 xQUg==
X-Gm-Message-State: AC+VfDwVeef+iwMuZH54heG27ZD1Q2gRlTpBBBzFoykVXB3B6aUeIw2S
 DOh2FMYwwuqeFG7DUP4AvqzG/vOJNtJ4Un0zYec=
X-Google-Smtp-Source: ACHHUZ56xIwu+OAsmj4ap7FEJYDEFDc65SEAcDRmxfPUsg25AN6kC4stY0LeDhYT4ZvsYWBDy+bC2g==
X-Received: by 2002:a17:90b:1e49:b0:250:9aee:563c with SMTP id
 pi9-20020a17090b1e4900b002509aee563cmr2506737pjb.41.1684516842239; 
 Fri, 19 May 2023 10:20:42 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9b89:2dd0:d160:429d])
 by smtp.gmail.com with ESMTPSA id
 gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:20:41 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 19 May 2023 10:18:26 -0700
Message-ID: <20230519101840.v5.2.I843b0d1de3e096ba111a179f3adb16d576bef5c7@changeid>
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
 Content preview:  Currently, in the watchdog_overflow_callback() we first check
 to see if the watchdog had been touched and _then_ we handle the workaround
 for turbo mode. This order should be reversed. Specifically, "touching" the
 hardlockup detector's watchdog should avoid lockups being detected for one
 period that should be roughly the same regardless of whether we're running
 turbo or not. That me [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.174 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q03u1-0007Mr-TV
Subject: [Kgdb-bugreport] [PATCH v5 02/18] watchdog/perf: More properly
 prevent false positives with turbo modes
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

Currently, in the watchdog_overflow_callback() we first check to see
if the watchdog had been touched and _then_ we handle the workaround
for turbo mode. This order should be reversed.

Specifically, "touching" the hardlockup detector's watchdog should
avoid lockups being detected for one period that should be roughly the
same regardless of whether we're running turbo or not. That means that
we should do the extra accounting for turbo _before_ we look at (and
clear) the global indicating that we've been touched.

NOTE: this fix is made based on code inspection. I am not aware of any
reports where the old code would have generated false positives. That
being said, this order seems more correct and also makes it easier
down the line to share code with the "buddy" hardlockup detector.

Fixes: 7edaeb6841df ("kernel/watchdog: Prevent false positives with turbo modes")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- ("More properly prevent false ...") promoted to its own patch for v5.

 kernel/watchdog_hld.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_hld.c
index 247bf0b1582c..1e8a49dc956e 100644
--- a/kernel/watchdog_hld.c
+++ b/kernel/watchdog_hld.c
@@ -114,14 +114,14 @@ static void watchdog_overflow_callback(struct perf_event *event,
 	/* Ensure the watchdog never gets throttled */
 	event->hw.interrupts = 0;
 
+	if (!watchdog_check_timestamp())
+		return;
+
 	if (__this_cpu_read(watchdog_nmi_touch) == true) {
 		__this_cpu_write(watchdog_nmi_touch, false);
 		return;
 	}
 
-	if (!watchdog_check_timestamp())
-		return;
-
 	/* check for a hardlockup
 	 * This is done by making sure our timer interrupt
 	 * is incrementing.  The timer interrupt should have
-- 
2.40.1.698.g37aff9b760-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
