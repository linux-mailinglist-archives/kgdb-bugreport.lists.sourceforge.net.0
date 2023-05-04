Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 995266F78F4
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 00:20:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puhJj-0004kn-D4
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 04 May 2023 22:20:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puhJi-0004kh-FC
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aOpu4K0AbTK/Q+LJp4KPhDC1e5615vKmnF8Avzjqp1E=; b=dc9A9EJAkvW2n/9JvyILmePCWW
 Jx9gHEk6atiOLLy9S3kA1j9HBycwHGTmwzRu2rE/E9FhNYVlkoOY9SRSwglxNN52DasRQQejlNYOW
 zXZWNbV6H6O5KonWzyVlh0chE57xUlKzHAGvFUSo/nzgnwjGg1lrB45p4Al4qaAGppek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aOpu4K0AbTK/Q+LJp4KPhDC1e5615vKmnF8Avzjqp1E=; b=ROUUPZVx4gU+AKpqaGMTdu3zQq
 cs5l9+eCovsCOVo9XHSrjQg0YAasZMbdbWc5m4y8GmVP17u4dNfzIjqKLfZen72Tf3vMVCUnTJEvb
 dA2ky2GaDpPzEoX+dHvRGX+WD2kMBq5Uw740T/R1/bi0QX4TzMgFiTM4FFPmuxZNd7bs=;
Received: from mail-yb1-f180.google.com ([209.85.219.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puhJi-00ESuA-HQ for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:20:51 +0000
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-ba1cfbb860dso15881276.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683238844; x=1685830844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aOpu4K0AbTK/Q+LJp4KPhDC1e5615vKmnF8Avzjqp1E=;
 b=jAYKGz3RydShTirqJnIh2UkFyp0DPrh/3CkuotUuE+fenqhW74IQHwSAzUDVCQ0xwl
 dNGY0MXPVLSEs+xASc8Ac/4vKdvcIGsyf2KMqsagZuk56iAZec53/jG+vqvb/DGUC9nh
 KLK3JHCNP6T3HURDdFEWKh/20tvMdgfNgJ8X8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683238844; x=1685830844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aOpu4K0AbTK/Q+LJp4KPhDC1e5615vKmnF8Avzjqp1E=;
 b=IXBifh3D/xK4FqH1cOBgpWNhkUnaTa5f9BJdxg7xI8HI62YkAwH8iazjc2V8/1op7Z
 dLhIB2mbc4BdOfFzI+Q/P2NGagJpiWOqDWtHPxMGog85DrGglpoGm4rNqCfnTSJQyTHl
 QWX8DIrYPG5Ce03PSxxez1voy9s5rSwQBK1WNJk4OzUJ+Xy787d+SGYohECfMq9QEX5I
 RWH2hTrqcZox0q0SC3mgPDhktcMZQ9k4SuDyBOGwLEXJCE/zM+5bTBQwSY3kiWjjPCiB
 PwerkVQeDr1haO7v9AKc1RNP6X4s3c5dMb33/64yNWFdD0TgLd2p2iQKX2JTE+LzdzVQ
 AtJg==
X-Gm-Message-State: AC+VfDwlF9J4KcleopM4XUBFC67u1D+BAsjlVrpcv/8oSmkGMFQo05gO
 uQrCxfEzKFB9eT3P6BWldnqEcoiTAAyYx3Vrmz4=
X-Google-Smtp-Source: ACHHUZ6/nKe5trCUHnOhrXovtrUyQ0CQn+r16BvPpklIKc+6VPGovlM2nNhX9qvrY/8nVCSqNXN/Lw==
X-Received: by 2002:a05:6a00:8086:b0:634:c34f:e214 with SMTP id
 eh6-20020a056a00808600b00634c34fe214mr3971422pfb.10.1683238499411; 
 Thu, 04 May 2023 15:14:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
 by smtp.gmail.com with ESMTPSA id
 g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 15:14:58 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  4 May 2023 15:13:37 -0700
Message-ID: <20230504151100.v4.5.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <20230504221349.1535669-1-dianders@chromium.org>
References: <20230504221349.1535669-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In preparation for the buddy hardlockup detector,
 rename touch_nmi_watchdog()
 to touch_hardlockup_watchdog() to make it clear that it will touch whatever
 hardlockup detector is configured. We'll add a [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.180 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.180 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puhJi-00ESuA-HQ
Subject: [Kgdb-bugreport] [PATCH v4 05/17] watchdog/hardlockup: Rename
 touch_nmi_watchdog() to touch_hardlockup_watchdog()
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

In preparation for the buddy hardlockup detector, rename
touch_nmi_watchdog() to touch_hardlockup_watchdog() to make it clear
that it will touch whatever hardlockup detector is configured. We'll
add a #define for the old name (touch_nmi_watchdog) so that we don't
have to touch every piece of code referring to the old name.

Ideally this change would also rename the arch_touch_nmi_watchdog(),
but that is harder since arch_touch_nmi_watchdog() is exported with
EXPORT_SYMBOL() and thus is ABI. Add a comment next to the call to
hopefully alleviate some of the confusion here.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("Rename touch_nmi_watchdog() to ...") new for v4.

 include/linux/nmi.h | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 454fe99c4874..35d09d70f394 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -125,18 +125,35 @@ void watchdog_nmi_disable(unsigned int cpu);
 void lockup_detector_reconfigure(void);
 
 /**
- * touch_nmi_watchdog - restart NMI watchdog timeout.
+ * touch_hardlockup_watchdog - manually pet the hardlockup watchdog.
  *
- * If the architecture supports the NMI watchdog, touch_nmi_watchdog()
- * may be used to reset the timeout - for code which intentionally
- * disables interrupts for a long time. This call is stateless.
+ * If we support detecting hardlockups, touch_hardlockup_watchdog() may be
+ * used to pet the watchdog (reset the timeout) - for code which
+ * intentionally disables interrupts for a long time. This call is stateless.
  */
-static inline void touch_nmi_watchdog(void)
+static inline void touch_hardlockup_watchdog(void)
 {
+	/*
+	 * Pass on to the hardlockup detector selected via CONFIG_. Note that
+	 * the hardlockup detector may not be arch-specific nor using NMIs,
+	 * but arch_touch_nmi_watchdog() is exported with EXPORT_SYMBOL() and
+	 * is thus ABI.
+	 */
 	arch_touch_nmi_watchdog();
+
+	/*
+	 * Touching the hardlock detector implcitily pets the
+	 * softlockup detector too
+	 */
 	touch_softlockup_watchdog();
 }
 
+/*
+ * It's encouraged for code to refer to the new name, but allow the old
+ * name as well.
+ */
+#define touch_nmi_watchdog	touch_hardlockup_watchdog
+
 /*
  * Create trigger_all_cpu_backtrace() out of the arch-provided
  * base function. Return whether such support was available,
-- 
2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
