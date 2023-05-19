Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF65570A953
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 20 May 2023 18:55:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q0PrA-0000u6-LX
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 20 May 2023 16:55:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q03sO-0005gZ-Id
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/7nsegKilU8iY/CeHEQ2XMVIjaNVdBVM5JDOxat9ACo=; b=gNJE+vy8nZBsKrRL9UfvF1qyS9
 yPPLPfaeHVG3naS9t0O7Oik+qLj4L5vA3lCZFP0rFa++CLJkb7AImc8pNwMkk0Pgrebx8Uw/28PpC
 f4FsIthwrYOf/9BrLyfyeTpI1aSTErV+1IKDmxxO/SFIxxLOhzYMls/dKfNvJ9s/Mx5A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/7nsegKilU8iY/CeHEQ2XMVIjaNVdBVM5JDOxat9ACo=; b=ShKsfdK28dNJhqkEnupp4r7ZDL
 qOWoemROWuNvl9/+jBDtcsbTyv2cvOv25G33lfNYu7sDvkEQfduR0IZJkMWew54zrKand68soFDtf
 rXdoecdfsSukbjfGIGUhSCQZp3cBfOfeF1pvEZ/CaZ4mGT6jxr1B3ahe8YkanzIJ3/SI=;
Received: from mail-yb1-f175.google.com ([209.85.219.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q03sN-0007Jn-Vd for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:26:48 +0000
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-ba86ec8047bso4874985276.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684517202; x=1687109202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/7nsegKilU8iY/CeHEQ2XMVIjaNVdBVM5JDOxat9ACo=;
 b=fFAPkvWAteKCZt7AUwVEA0Q7NFtro1NgcNzSpYUUuZ4pFBpaP045qHaOzlegAJ2D22
 eUVab1O2lVEQtAZwO/Til+uCKkcmVDmmLVTZN3OPkj0Bxvvkrp2kZ86veB0rxd1EuSti
 4T/ZESiTopWc6+72ezEBdHlvLSjkDa4R6Ehb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684517202; x=1687109202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/7nsegKilU8iY/CeHEQ2XMVIjaNVdBVM5JDOxat9ACo=;
 b=UCbjabHY8+1EadqDZHgyU7gl4nWyFF+HRZrOPU0rz8kcIBSzULMqBSYeYMFGMT8DfW
 JpFxzW034uaRleLZTK+nMv33wfxFVezrZRneP3CqaHqFT7b1f/Y6rprAOw1/JxKnO/CG
 +Jp+i1A8Q13Cse+ljPWl7rJxgzO7WUSQovUY71DaXLZSpA7ZVjJXZCOyx/+eKaE/dSIB
 orp+QI3noo6PJhZUUoTsvwOVxHyJ2M4nI3M3VVFGiuCdooEM4aYVyF1O4Ak59MEYynew
 vCqSnLEaM9AtZhyVtiyzxLsNsEdgpq+DOJ7C+eEQ9UQN4b99i/0xoHFJvDfQi1c7GKO7
 n2lw==
X-Gm-Message-State: AC+VfDw0Vp3NGSjQgnr6hr/CPjwPEwEr7/IRaPU7OVtY0P0RFJK9+wJB
 bbQYqOMEWtR7SzuY4eISmkktymvu3+UlCSCrMpo=
X-Google-Smtp-Source: ACHHUZ78KuQvgskyCDTAlOMExtVERg2yOkymJq8jyThLWiYxqXpls34rasoUDDbhLlKOIhF5z6rP+Q==
X-Received: by 2002:a17:90a:8541:b0:250:d2d8:c179 with SMTP id
 a1-20020a17090a854100b00250d2d8c179mr2837454pjw.29.1684516854855; 
 Fri, 19 May 2023 10:20:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9b89:2dd0:d160:429d])
 by smtp.gmail.com with ESMTPSA id
 gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:20:54 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 19 May 2023 10:18:30 -0700
Message-ID: <20230519101840.v5.6.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
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
 Content preview:  In preparation for the buddy hardlockup detector,
 add comments
 to touch_nmi_watchdog() to make it obvious that it touches the configured
 hardlockup detector regardless of whether it's backed by an NMI [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.175 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.175 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q03sN-0007Jn-Vd
Subject: [Kgdb-bugreport] [PATCH v5 06/18] watchdog/hardlockup: Add comments
 to touch_nmi_watchdog()
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

In preparation for the buddy hardlockup detector, add comments to
touch_nmi_watchdog() to make it obvious that it touches the configured
hardlockup detector regardless of whether it's backed by an NMI. Also
note that arch_touch_nmi_watchdog() may not be architecture-specific.

Ideally, we'd like to rename these functions but that is a fairly
disruptive change touching a lot of drivers. After discussion [1] the
plan is to defer this until a good time.

[1] https://lore.kernel.org/r/ZFy0TX1tfhlH8gxj@alley

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- No longer rename touch_nmi_watchdog(), just add comments.

Changes in v4:
- ("Rename touch_nmi_watchdog() to ...") new for v4.

 include/linux/nmi.h | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 454fe99c4874..fafab128f37e 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -125,15 +125,30 @@ void watchdog_nmi_disable(unsigned int cpu);
 void lockup_detector_reconfigure(void);
 
 /**
- * touch_nmi_watchdog - restart NMI watchdog timeout.
+ * touch_nmi_watchdog - manually pet the hardlockup watchdog.
  *
- * If the architecture supports the NMI watchdog, touch_nmi_watchdog()
- * may be used to reset the timeout - for code which intentionally
- * disables interrupts for a long time. This call is stateless.
+ * If we support detecting hardlockups, touch_nmi_watchdog() may be
+ * used to pet the watchdog (reset the timeout) - for code which
+ * intentionally disables interrupts for a long time. This call is stateless.
+ *
+ * Though this function has "nmi" in the name, the hardlockup watchdog might
+ * not be backed by NMIs. This function will likely be renamed to
+ * touch_hardlockup_watchdog() in the future.
  */
 static inline void touch_nmi_watchdog(void)
 {
+	/*
+	 * Pass on to the hardlockup detector selected via CONFIG_. Note that
+	 * the hardlockup detector may not be arch-specific nor using NMIs
+	 * and the arch_touch_nmi_watchdog() function will likely be renamed
+	 * in the future.
+	 */
 	arch_touch_nmi_watchdog();
+
+	/*
+	 * Touching the hardlock detector implcitily pets the
+	 * softlockup detector too
+	 */
 	touch_softlockup_watchdog();
 }
 
-- 
2.40.1.698.g37aff9b760-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
