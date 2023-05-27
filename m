Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC1F7131A0
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 27 May 2023 03:42:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q2ix9-0002E3-UP
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 27 May 2023 01:42:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q2ix6-0002Dq-C6
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JxNnTqvzGhDuJSCmbsa+rtoHfqlXA4TJSz9TjwxMeho=; b=JWgKAbFbWQfwLQfZk9GRIKCuE1
 egEWsZiA/ziudNteeiX2/2niOpkBeoIZk24ndqVaoGQIJ0X/o/qTiwVLwTkS88pAnPpodiBChOwtM
 fiXm/WpTlhDnWmASmDDE5UqaZd2j3KJmpz53cmtvW1PA/ZpBkvprym2zBUY6As9cCj/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JxNnTqvzGhDuJSCmbsa+rtoHfqlXA4TJSz9TjwxMeho=; b=LwYVh/AiNZfjUm9P7DuAIhjxkB
 zT932Znz/VbGXtRp0rXSaZRFgWwGnTE773avDqDOAq3K4ZmpDaHpuxc/Y13zR0X14s6E5Q3gtZzEW
 BCY30jfzhBj4qkppgmObC0/Ep3kVfpTiMLuOcfl/c0VMARPAYAeohjfafJAmY5cIjPNM=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q2ix5-003o3c-Ct for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:41 +0000
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-64d30ab1f89so1114483b3a.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 May 2023 18:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685151754; x=1687743754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JxNnTqvzGhDuJSCmbsa+rtoHfqlXA4TJSz9TjwxMeho=;
 b=ShJfBqA9ft7ncDs0dOFd2RPnmhJyBiEjNx2LZ1p8J3ek51VUldJqNKK6EfAx/6LMhv
 I51cZ9p9OhuJ3HYRQJPDRwiiLTttUI75WZhav7nrw8b5x+FhEcc5+eyfOPfL9y63jllh
 02RO3yac0QfbIeTbVj1CHjUWHigjgjdAjKjnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685151754; x=1687743754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JxNnTqvzGhDuJSCmbsa+rtoHfqlXA4TJSz9TjwxMeho=;
 b=HgfjnyVHpENTc1r2GXc5+C+VqGst8AEdc99VYx+Ir9dy6LB3AMnWQmb9zzTL2xyEi7
 48IU7Xe03q+rVbwwfZhhEcYUPtWue7YI+LpYy4/SqK7Og0htuJNgeay3VzUy8LjbtvGT
 SxcjrbbFd5dJ/xM2ey/3T0z0HiZ4yZyBX0TrktuzfagPi/MY3vLt30SlIMEGyaCdjbzp
 4lb8bBy36cSMabQ2MyE4p+UfBSHwZI1AJkAoVJTz5FmQjzH/Fk5zqyHIaVZMQgEayjZ7
 PKdGT6tBPH5FOTVT5RRNmVWr8wU1s7JAkNLTJwZWaUFohSzxWLWkee9VnuGv+Ma/UClj
 4cFQ==
X-Gm-Message-State: AC+VfDxKG+oW5aDgn1Q1Vm9Go8lroOwhjx/N8+DT7TZsMmyIbZoIhf8w
 DXA2en1EYAvFQw+TY7E4+IJy/Q==
X-Google-Smtp-Source: ACHHUZ44oKfcxHCQB35NN8gNpgRMYCCD+rINnjdYYnIa0h9+Lp5g65zql8hV6FRXqlU+zWxTf6WHVg==
X-Received: by 2002:a05:6a00:3911:b0:63b:7fc0:a4af with SMTP id
 fh17-20020a056a00391100b0063b7fc0a4afmr5852154pfb.26.1685151753915; 
 Fri, 26 May 2023 18:42:33 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4015:7255:c79a:26d7])
 by smtp.gmail.com with ESMTPSA id
 x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 18:42:33 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 26 May 2023 18:41:40 -0700
Message-ID: <20230526184139.10.I821fe7609e57608913fe05abd8f35b343e7a9aae@changeid>
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
 Content preview: HAVE_HARDLOCKUP_DETECTOR_NON_ARCH is a mouthful and
 confusing.
 HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY is even more of a mouthful, but probably
 less confusing. Rename the Kconfig names. Signed-off-by: Douglas Anderson
 <dianders@chromium.org> --- 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.182 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2ix5-003o3c-Ct
Subject: [Kgdb-bugreport] [PATCH 10/10] watchdog/hardlockup: Rename
 HAVE_HARDLOCKUP_DETECTOR_NON_ARCH to ..._PERF_OR_BUDDY
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

HAVE_HARDLOCKUP_DETECTOR_NON_ARCH is a mouthful and
confusing. HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY is even more of a
mouthful, but probably less confusing. Rename the Kconfig names.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 lib/Kconfig.debug | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index eb1edd5905bc..b9e162698a82 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1058,7 +1058,7 @@ config HARDLOCKUP_DETECTOR_BUDDY
 # needs SMP). In either case, using the "non-arch" code conflicts with
 # the NMI watchdog code (which is sometimes used directly and sometimes used
 # by the arch-provided hardlockup detector).
-config HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
+config HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY
 	bool
 	depends on (HAVE_HARDLOCKUP_DETECTOR_PERF || SMP) && !HAVE_NMI_WATCHDOG
 	default y
@@ -1077,10 +1077,10 @@ config HARDLOCKUP_DETECTOR_PREFER_BUDDY
 	  an arch-specific hardlockup detector or if resources needed
 	  for the hardlockup detector are better used for other things.
 
-# This will select the appropriate non-arch hardlockdup detector
-config HARDLOCKUP_DETECTOR_NON_ARCH
+# This will select the appropriate non-arch hardlockup detector
+config HARDLOCKUP_DETECTOR_PERF_OR_BUDDY
 	bool
-	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
+	depends on HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY
 	select HARDLOCKUP_DETECTOR_BUDDY if !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_PREFER_BUDDY
 	select HARDLOCKUP_DETECTOR_PERF if HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY
 
@@ -1098,9 +1098,9 @@ config HARDLOCKUP_CHECK_TIMESTAMP
 config HARDLOCKUP_DETECTOR
 	bool "Detect Hard Lockups"
 	depends on DEBUG_KERNEL && !S390
-	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH || HAVE_HARDLOCKUP_DETECTOR_ARCH
+	depends on HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY || HAVE_HARDLOCKUP_DETECTOR_ARCH
 	select LOCKUP_DETECTOR
-	select HARDLOCKUP_DETECTOR_NON_ARCH if HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
+	select HARDLOCKUP_DETECTOR_PERF_OR_BUDDY if HAVE_HARDLOCKUP_DETECTOR_PERF_OR_BUDDY
 
 	help
 	  Say Y here to enable the kernel to act as a watchdog to detect
-- 
2.41.0.rc0.172.g3f132b7071-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
