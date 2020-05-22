Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 038E21DEA6D
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 May 2020 16:55:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jc955-0006np-QY
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 May 2020 14:55:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jc953-0006ng-F6
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 14:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lgzE6vmodHXJVgkKRydSUcePpApP1sHs6gyeaxLAapY=; b=ThFsiGqYXeIX0Vn9M6b7DHliLj
 TSMQtVC78oiYqilaFaRglPcguW+LHov4kW8lA+Ai/kU0yzhMCVS4vgZcJs+2X6eyEKUF8e9kfN3E7
 n6pIyO1QbnIiAoq7s6qy3LqYnx2uuvWYfphstJhiy6HxPGnJ+GryTyzn91qnWs+0WCTk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lgzE6vmodHXJVgkKRydSUcePpApP1sHs6gyeaxLAapY=; b=Z
 sDR9QXqHZMG1j7XLLRGD2vmQD9vEuSDXnGbDnSYQnuu+bTUs2fLYjjnuN4YkLgWyhQwtLbfmShdGp
 dg4x/PkG/Uf1HwcQwCA5BbHBzjxnqxbu37Pr5uFoaXw33/0wZHYfsj2jBFcjTz7a3j7bCVNa87BNR
 REbN1qJp0RxbcGvM=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jc94y-00CzpT-So
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 14:55:25 +0000
Received: by mail-wm1-f68.google.com with SMTP id v19so3114682wmj.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 May 2020 07:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lgzE6vmodHXJVgkKRydSUcePpApP1sHs6gyeaxLAapY=;
 b=nlECE+b5yqlKJA6jFTmww2E3QJ5WbURdCUstW1I6PIZDCOg7WHcBF8kQGWXownwX8q
 cx47KBJ7D3Kpgz7C/7gSay4yxudmJQeS0U6UpnN8yikGE80+hrwjyvSeR1qtaT3ZgFKE
 ieRGgX9H7LAdv95xfmKHwW8jV2ZRnxqpjjBf4NZx4nvPLuUu/BJTHWw7eqV6Koa9/qkr
 JB0fkVDznqDDtD+xlGCIU0gIk7VJ0Xuww0a46q46q0i/o3SnK7lYEd4BfRs87OX6KBp/
 Ym+angsnPVjD1w6IrheE1cC8TpDgg2vBCMdQt6/wtp8Cdjk+KOybz62XMS/vl1SaHje7
 ZRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lgzE6vmodHXJVgkKRydSUcePpApP1sHs6gyeaxLAapY=;
 b=hAgvD5AUQdfHiVQECNJkdUk+7aMDV8HTajsZYjabPtvC9ar1/l3ZSAABhvh3hzsgJG
 9me3ReWIeAAG2h38fQr4GvvM81YIXEXdzEuM/A1U/iIn9QIz1KzTH0h9hKe/VPOzMTIf
 biTFrLhx8Jai1xRP+uIXuELkvJQAGCJESzTT+xoxrsy1dm7t7tQyD6DGD1ietFPGK3Gl
 8Sp4+N/TFowqHeY9idPjEWz0vn2QXrdzFn2EeR0Sp8DySobe+aYjTywVDqgh0ECb7mEB
 PNplqm65vND503/XBAvQJ9i18SFtPa7stAnibN/BBQscoqfRqxs3BMoTojAGdAgkHmnI
 93sQ==
X-Gm-Message-State: AOAM531f7Y8/tKiHW0WbILSegeWDp0fdoZCc7IDCn9Qbfndu3hvtXjc7
 L3cAK6fvD1tRhlywREUqvEFuBg==
X-Google-Smtp-Source: ABdhPJx3E/Vjh2T3jdWf3YQgn4TzMfj6PDDxH6vq8U6IEpR89l/Y7afo7n+52RmZLhGuPaW2lu7RlA==
X-Received: by 2002:a1c:6583:: with SMTP id
 z125mr13863329wmb.102.1590159314476; 
 Fri, 22 May 2020 07:55:14 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id i21sm9746911wml.5.2020.05.22.07.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 07:55:13 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: sumit.garg@linaro.org, jason.wessel@windriver.com, dianders@chromium.org
Date: Fri, 22 May 2020 15:55:08 +0100
Message-Id: <20200522145510.2109799-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jc94y-00CzpT-So
Subject: [Kgdb-bugreport] [RFC PATCH 0/2] Introduce KGDB_DEBUG_SPINLOCKS
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
Cc: pmladek@suse.com, Daniel Thompson <daniel.thompson@linaro.org>,
 patches@linaro.org, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 sergey.senozhatsky@gmail.com, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The execution context for kgdb/kdb is pretty much unique. We are running
a debug trap handler with all CPUs parked in a holding loop and with
interrupts disabled. At least one CPU is in an unknowable execution
state (could be NMI, IRQ, irqs disabled, etc) and the others are either
servicing an IRQ or NMI depending on architecture.

Breakpoints (including some implicit breakpoints when serious errors
are detected) can happen on more or less any context, including when we
own important spin locks.

As such spin lock waits should never happen whilst we are executing the
kgdb trap handler used except, occasionally, via an explicit command
from a (forewarned?) local operator.

Currently kdb doesn't meet this criteria (although I think kgdb does)
so I started thinking about what tooling we could employ to reinforce
code review and bring problems to the surface.

The result is a patch that extends DEBUG_SPINLOCKS and checks whether
the execution context is safe. The "except via an explicit command"
aspect (mentioned above) convinced me to make the checks conditional
on KGDB_DEBUG_SPINLOCKS.

Daniel Thompson (2):
  debug: Convert dbg_slave_lock to an atomic
  locking/spinlock/debug: Add checks for kgdb trap safety

 include/linux/kgdb.h            | 16 ++++++++++++++++
 kernel/debug/debug_core.c       |  8 ++++----
 kernel/locking/spinlock_debug.c |  4 ++++
 lib/Kconfig.kgdb                | 11 +++++++++++
 4 files changed, 35 insertions(+), 4 deletions(-)


base-commit: 6a8b55ed4056ea5559ebe4f6a4b247f627870d4c
--
2.25.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
