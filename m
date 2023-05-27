Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B447713198
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 27 May 2023 03:42:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q2iwy-0004NC-4u
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 27 May 2023 01:42:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q2iww-0004N3-Fp
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cYlDoP4hBUi1FEPJVk5SoicXju51KfuvgdrLi507k6g=; b=FnFk5jcD2MhZReJidoUhswN6/z
 pcyPgJ1owJv6y6wL0AELjY0h/o/COopag1o64omV8sPVU9t8nkbXa7RRGiItTBwW9Tq0Pjf1GQuIv
 jy1d/mhCOoa4u7pLrQFpkHdnt+fA1Bhe6GOGFnjNthNY7oBz90s3+mSPaA3+EMsaVcYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cYlDoP4hBUi1FEPJVk5SoicXju51KfuvgdrLi507k6g=; b=EYnwM271cMKnMfDm3HTgRZ/6Qz
 UqLephGsHZFUeOE4o+V2kopLXEFWHXfQG++dwsLrIyLiEwzDYEjRJqjHH7eXA9h9EltWvCLQt3mJY
 mCpeJIXY1IZfmjTdyK6xaQJsxBp+Q4jCbh6WkLhduQ54q9m0heo03xUjXPXgJ5e23cy0=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q2iwu-003o2L-TP for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:30 +0000
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-64f47448aeaso1187657b3a.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 May 2023 18:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685151743; x=1687743743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cYlDoP4hBUi1FEPJVk5SoicXju51KfuvgdrLi507k6g=;
 b=gGebBDgShZ+uN8dr+HtKBh/CQRIJdRl3JqouzIec7Inm884gWhnWsPBrktTgLBZqXK
 0Vn2L9wyjn0IxKnQRYUzz2PDRwxJ3dxbO49ReX7U7tQFaXawnlPxAsmZ8tisnLvHt2wy
 vVnzj/jVyWUESXQN92jj0oJ3Exaj1AaFGtAnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685151743; x=1687743743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cYlDoP4hBUi1FEPJVk5SoicXju51KfuvgdrLi507k6g=;
 b=H+6cJ6rlP6MAibMwxrJwEy4V4kUnr7bvrkW3ynxSthzygpcDzcwiU5nh5tyMnsd1yP
 KxdaB7EKl/SIV4PgNHZQvcju5w3CUlRK1y/u+oU43bgW7J8tdfmrElTvCKscjpjAjUBr
 O4WaYZrDcQgQytL2aXlz57rsPeUPtTeRK4Ks/1qMKjJu6rZg0sNSaNIl3gfJfO6NHv68
 xo1uLLRILTmWr/eQoJmkMml/xh1wfFGC9XUDcFGXa6oCgiF8PUsiSrh08J4Ih2Hm2n+u
 CYOFXp5voj7wblVPlA25vX3mEgZLgfs3YHKkqNSwEvoGOc4MxCzNgd9IKPZrSN6Pnvmc
 1QFA==
X-Gm-Message-State: AC+VfDzGWnXZvLRow7bBual7+WtEoeRhd8yO8iSjNiNdA8uQyYhynWYJ
 f65njmPI3Cn8UuUdA+pKyn+6sw==
X-Google-Smtp-Source: ACHHUZ6PdCEKx9zc9UIjD6M27djXcRY5u4ncxaUOpt/n6iXeRwmVg57h5L9TsPisjROyLLUKXE2Imw==
X-Received: by 2002:a05:6a21:9985:b0:101:2ad0:1347 with SMTP id
 ve5-20020a056a21998500b001012ad01347mr1527991pzb.23.1685151743331; 
 Fri, 26 May 2023 18:42:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4015:7255:c79a:26d7])
 by smtp.gmail.com with ESMTPSA id
 x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 18:42:22 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 26 May 2023 18:41:34 -0700
Message-ID: <20230526184139.4.Iccee2d1ea19114dafb6553a854ea4d8ab2a3f25b@changeid>
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
 we started using a cpumask to keep track of which CPUs to backtrace. When
 setting up this cpumask, it's better to [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.179 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2iwu-003o2L-TP
Subject: [Kgdb-bugreport] [PATCH 04/10] watchdog/hardlockup: In
 watchdog_hardlockup_check() use cpumask_copy()
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
watchdog_hardlockup_check()") we started using a cpumask to keep track
of which CPUs to backtrace. When setting up this cpumask, it's better
to use cpumask_copy() than to just copy the structure directly. Fix this.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/watchdog.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 32dac8028753..85f4839b6faf 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -154,7 +154,9 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 	 */
 	if (is_hardlockup(cpu)) {
 		unsigned int this_cpu = smp_processor_id();
-		struct cpumask backtrace_mask = *cpu_online_mask;
+		struct cpumask backtrace_mask;
+
+		cpumask_copy(&backtrace_mask, cpu_online_mask);
 
 		/* Only print hardlockups once. */
 		if (per_cpu(watchdog_hardlockup_warned, cpu))
-- 
2.41.0.rc0.172.g3f132b7071-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
