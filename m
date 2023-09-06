Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3097942B3
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  6 Sep 2023 20:04:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qdwsn-0006Q5-LF
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 06 Sep 2023 18:04:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qdv2t-00053v-BC
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 06 Sep 2023 16:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qj/cLRwqRCqHI6A0+VpIGgNKYM1V9qr45vJe0jTCZJg=; b=KWCv2x6wY2Xkj+Fkpms1dygT76
 tpG3CDbu+fBKiC5x1IjyNn0J3rLp/k8vhr9X+3/IrEh/TCZnAJ9y3J5iLFq/wMqFhOfyo/YzGxuXX
 hwgHYQpwTDW3d9EZOPM4eLpPrgakTFnhsbyO847hnoNOVIdA2Eh36yxOsQjdejpADdWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qj/cLRwqRCqHI6A0+VpIGgNKYM1V9qr45vJe0jTCZJg=; b=UfkBNNIdvvBcbEsms8HfZxi8O4
 P5d/MCM6PMre5gWmeI/M+IBVjMnncMqTRNboj7NMp+zgr7IrFxV3JSYuARpB+aYctOd6wB1CS+i6K
 oqUY4UklQylDmOOpuZSqCDnvjvTFE0towvOyi44TSRwMBPOLGlR8GYeOd0WGzrDKEMdE=;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qdv2q-00040c-8d for kgdb-bugreport@lists.sourceforge.net;
 Wed, 06 Sep 2023 16:06:23 +0000
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1c0ecb9a075so22286395ad.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 06 Sep 2023 09:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694016374; x=1694621174;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qj/cLRwqRCqHI6A0+VpIGgNKYM1V9qr45vJe0jTCZJg=;
 b=GSj+yAT+10l3a5bkBtDrOMkcnPRnZaKyCWiqyO90w68XsWkCj5fQAeRBxcJBqrFeFl
 1MU3qhB8BQ6fMmr+lz1jR54PnuI12FS3TEqe/kML7JMOKXLkluA80g5R9QnQjQdtUDW1
 SYGziSoQ6hzcU/v4nQRimoXjBCeA94z0YXcPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694016374; x=1694621174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qj/cLRwqRCqHI6A0+VpIGgNKYM1V9qr45vJe0jTCZJg=;
 b=J8Vsm9p5cm7HE/Eiys8YuNLh3yrfYcl1xk2fJyxQcg9SD4Rtp2NbV0jMA8VUEJETJN
 UcCOwU8RTbVgdf2ys9WUtpr3rPkS3CCu3XCvv1JrHqC0j0OP42WH4FukUwAG0ek8Q/4h
 QrAhAiLm27aX01jicHu8WTMAQW/8AvngUq+sMATiZxsUaJkoa6q3zJeuzLUJ+VLIl3ux
 De7NASzHYNMZb1J+nIF1KwaO85vXjWVwQmn0Bo2dQG38/Ev8PZk2mtlod+jegBbl0Xj3
 ShnmKJw56eVCzUQufyizJlHfYftJNGN8cfJ/jzy/PcB1jApw8ravtOKtrO4sqzIWQUR6
 zrYg==
X-Gm-Message-State: AOJu0YxklFpQAHf+f3VNNTwIcsUvV5N07eTm9PW6KPWy8H87SKyhKchd
 cBWCrMsqUR+ANiK4idkq1urjSg==
X-Google-Smtp-Source: AGHT+IH8tU2R8ed2JHyL2LLKGxknTebDB1XNgq+5JhdlRzNQTuRPiDweqaRM4tYwRz/RnbnKvuWVOQ==
X-Received: by 2002:a17:903:32c6:b0:1bd:c931:8c32 with SMTP id
 i6-20020a17090332c600b001bdc9318c32mr15979784plr.62.1694016374620; 
 Wed, 06 Sep 2023 09:06:14 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4a07:e00a:fdae:750b])
 by smtp.gmail.com with ESMTPSA id
 ju19-20020a170903429300b001b8c689060dsm11338859plb.28.2023.09.06.09.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 09:06:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Wed,  6 Sep 2023 09:03:00 -0700
Message-ID: <20230906090246.v13.5.Ifadbfd45b22c52edcb499034dd4783d096343260@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230906160505.2431857-1-dianders@chromium.org>
References: <20230906160505.2431857-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There's no reason why IPI_CPU_STOP and IPI_CPU_CRASH_STOP
 can't be handled as NMI. They are very simple and everything in them is
 NMI-safe.
 Mark them as things to use NMI for if NMI is available. Suggested-by: Mark
 Rutland <mark.rutland@arm.com> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
 Reviewed-by: Misono Tomohiro <misono.tomohiro@fujitsu.com> Reviewed-by: Sumit
 Garg <sumit.garg@linaro. [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.177 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.177 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qdv2q-00040c-8d
Subject: [Kgdb-bugreport] [PATCH v13 5/7] arm64: smp: IPI_CPU_STOP and
 IPI_CPU_CRASH_STOP should try for NMI
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
Cc: vschneid@redhat.com, ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 jpoimboe@kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Stephane Eranian <eranian@google.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Tomohiro Misono <misono.tomohiro@fujitsu.com>, scott@os.amperecomputing.com,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

There's no reason why IPI_CPU_STOP and IPI_CPU_CRASH_STOP can't be
handled as NMI. They are very simple and everything in them is
NMI-safe. Mark them as things to use NMI for if NMI is available.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Misono Tomohiro <misono.tomohiro@fujitsu.com>
Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This patch is tested by Mark Rutland's LKDTM test [1].

[1] http://lore.kernel.org/lkml/20230831101026.3122590-1-mark.rutland@arm.com

(no changes since v10)

Changes in v10:
- ("IPI_CPU_STOP and IPI_CPU_CRASH_STOP should try for NMI") new for v10.

 arch/arm64/kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 28c904ca499a..800c59cf9b64 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -946,6 +946,8 @@ static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
 		return false;
 
 	switch (ipi) {
+	case IPI_CPU_STOP:
+	case IPI_CPU_CRASH_STOP:
 	case IPI_CPU_BACKTRACE:
 		return true;
 	default:
-- 
2.42.0.283.g2d96d420d3-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
