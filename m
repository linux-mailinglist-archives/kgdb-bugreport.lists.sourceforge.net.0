Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1853713193
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 27 May 2023 03:42:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q2iwq-0002CI-97
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 27 May 2023 01:42:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q2iwo-0002CB-3u
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g8Wyvy6HPwlh6VYOHfNA0dxsOkmR5hf4tUOLdIYH19M=; b=LXLuCt+kW83ljFNVvYwGYRVN5D
 bMUTX7tCM4svpXNH390fT8B58fnJIO6R8tl3XLYZS/JJRQIXlIMRJs7Egr50foq2DE2gj/cDS8BO9
 T77WLA9+i9ehiPaIoKueKYuZQ1iAi2x879Fv44QbXMZQSs3RxdQuvs0XDpY3zfaX7n9s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=g8Wyvy6HPwlh6VYOHfNA0dxsOkmR5hf4tUOLdIYH19M=; b=g
 yaC87+Psz7l36V6Wimn/edZvmdeo1TgHYsXLLVI9RypmsGYffuSqS0naagN3DGs1dHEhHnKxvOar+
 bnXEX2+jerZ326DIctiK0pG4nldg+XManfMAwnQGsHpV9u9HZjlPxD0aiIkaS86gMP7BbRNhtQr6w
 4qn2hQrb2STyUWbE=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q2iwn-003o1e-Rz for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:22 +0000
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-64d2f99c8c3so1221688b3a.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 May 2023 18:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685151736; x=1687743736;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g8Wyvy6HPwlh6VYOHfNA0dxsOkmR5hf4tUOLdIYH19M=;
 b=jVupxr9tkpNoY2DPpNO8ve9RV3dt+XdDWaO2WoRtWo7O726zDUiL2HAAxcH6LHl3N4
 zg+XiJ3Z3hMClz9oQWCKKIy9P9nGkLhMbC/8iyvrxOUDtLp+WDuMwpTv3zKUdQXrfkDP
 KJUkxWt47+5T+11hbTnQ8sD/sndKaFgdvy0fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685151736; x=1687743736;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g8Wyvy6HPwlh6VYOHfNA0dxsOkmR5hf4tUOLdIYH19M=;
 b=hx1240D//u01M8TxKKXHZnWosIclpUYtSnhyJhxB1CP60WpWELp9DnUJMldfgfKIqZ
 KR2EFW/+CwPSxEn6TKE0TYBKxTpD7W5cQZzqEe8GaqBTXxIqHyb2gyMzCOJ4Y1zSivG5
 OyVE5D+OXIbTRdjSqN5fM1v1v5dr8nRLFYCZvhltTM5a9rP8TLPOcA5dR9ikpE/qyNq1
 nMxk9U3AOP4lPtz2s33CamB+NfT90ue110qqPT3G6y9CRK/F7Xw0Nri7g7A5JTXJMEkd
 bYcGS9kZlOrw6nk2M5ht4Vw/gwfqU7KIZjhfr1IdIa3IEdgqp5e6l2g78xjN7mOC7w/8
 f7Yg==
X-Gm-Message-State: AC+VfDxLTT9lvGP7Y+JGyZ0iIgnsBJfk0sp6pVf4tDQIChyzEcI17sLQ
 xV06mZnCquasFSX2oucA8GE5Pw==
X-Google-Smtp-Source: ACHHUZ4GAy/oEImCC0hpOXpTjNUo0Dhy+rQj32IqoVkt1EVytgp7ZHhTjG/XebwId5tT/CXJZBdMDQ==
X-Received: by 2002:a05:6a00:190e:b0:63b:8afe:a4dc with SMTP id
 y14-20020a056a00190e00b0063b8afea4dcmr5524785pfi.30.1685151736256; 
 Fri, 26 May 2023 18:42:16 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4015:7255:c79a:26d7])
 by smtp.gmail.com with ESMTPSA id
 x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 18:42:15 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 26 May 2023 18:41:30 -0700
Message-ID: <20230527014153.2793931-1-dianders@chromium.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch series attempts to finish resolving the feedback
 received from Petr Mladek on the v5 series I posted. Andrew has already landed
 v5 so I'm posting this as additional patches. Probably the only thing that
 wasn't fully as clean as Petr requested was the Kconfig stuff. I couldn't
 find a better way to express it without a more major overhaul. In the very
 least, I renamed "NON_ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.177 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.177 listed in list.dnswl.org]
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
X-Headers-End: 1q2iwn-003o1e-Rz
Subject: [Kgdb-bugreport] [PATCH 00/10] watchdog: Cleanup / fixes after
 buddy series v5 reviews
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


This patch series attempts to finish resolving the feedback received
from Petr Mladek on the v5 series I posted. Andrew has already landed
v5 so I'm posting this as additional patches.

Probably the only thing that wasn't fully as clean as Petr requested
was the Kconfig stuff. I couldn't find a better way to express it
without a more major overhaul. In the very least, I renamed "NON_ARCH"
to "PERF_OR_BUDDY" in the hopes that will make it marginally better.

Nothing in this series is terribly critical and even the bugfixes are
small. However, it does cleanup a few things that were pointed out in
review.


Douglas Anderson (10):
  watchdog/hardlockup: Keep kernel.nmi_watchdog sysctl as 0444 if probe
    fails
  watchdog/hardlockup: HAVE_NMI_WATCHDOG must implement
    watchdog_hardlockup_probe()
  watchdog/hardlockup: Don't use raw_cpu_ptr() in
    watchdog_hardlockup_kick()
  watchdog/hardlockup: In watchdog_hardlockup_check() use cpumask_copy()
  watchdog/hardlockup: remove softlockup comment in touch_nmi_watchdog()
  watchdog/buddy: Cleanup how watchdog_buddy_check_hardlockup() is
    called
  watchdog/buddy: Don't copy the cpumask in watchdog_next_cpu()
  watchdog/buddy: Simplify the dependency for
    HARDLOCKUP_DETECTOR_PREFER_BUDDY
  watchdog/hardlockup: Move SMP barriers from common code to buddy code
  watchdog/hardlockup: Rename HAVE_HARDLOCKUP_DETECTOR_NON_ARCH to
    ..._PERF_OR_BUDDY

 arch/Kconfig            |  3 +-
 arch/sparc/kernel/nmi.c |  5 +++
 include/linux/nmi.h     | 14 ++-------
 kernel/watchdog.c       | 68 ++++++++++++++++++-----------------------
 kernel/watchdog_buddy.c | 28 ++++++++++++++---
 lib/Kconfig.debug       | 14 ++++-----
 6 files changed, 70 insertions(+), 62 deletions(-)

-- 
2.41.0.rc0.172.g3f132b7071-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
