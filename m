Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E737874CD
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 24 Aug 2023 18:03:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qZCnc-0006nt-Jc
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 24 Aug 2023 16:03:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qZCnb-0006nn-30
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 24 Aug 2023 16:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+U+ZFko4eaNVS/k5E5YRzxI9X7/KmekX/8rZmWNkCMw=; b=Ff4U/KI9KKh0Zzh4JxUK3Z1FSb
 8pnZTeU6gTAmodKoiAur7gh/VIZ+kGbG+BwuSlwA/f+Hmb+nMQACi2hSgYcKVW5sDk5ZGSdCgEtJi
 UUTd4nrikLZ+x9gCUFzxb/Y1wrJVQ3tfBn+RkVRQyJK37em0njLqjBSNAeliiEqMLEig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+U+ZFko4eaNVS/k5E5YRzxI9X7/KmekX/8rZmWNkCMw=; b=Pcwhtm7ul9iNR7yEkVK86x0O2Z
 DRbYKvoRU5Z7X/lfVT0PPxShCioDuEEhkKx8soKh6tWS7gf1OPgcKacI6nONNrxBJ6sGecUNk3MYD
 T6rYoRg1TPz/IDT79rmc2EwvK66x4sKBWsB8u24IFKQHhtjaT3bJ3aRVkfArC/2QGnjk=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZCnX-00043s-5E for kgdb-bugreport@lists.sourceforge.net;
 Thu, 24 Aug 2023 16:03:06 +0000
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-68bee12e842so9620b3a.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 24 Aug 2023 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692892977; x=1693497777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+U+ZFko4eaNVS/k5E5YRzxI9X7/KmekX/8rZmWNkCMw=;
 b=APKrDUvihUaeSYDHNQ6SYf7li1acnmmk7cPnafx1qxkSDGcA/spsEwLvvJn0zsWeBv
 Je1UNudvFOoraRKTQupmYaA1pf5eC1ZlM0hMOovmzlyMZCLmUtoxECcI1VmcFtMAzdcS
 IKFosdFb/+AxeTZq8fNUzlvIWWPaFl1DOaQas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692892977; x=1693497777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+U+ZFko4eaNVS/k5E5YRzxI9X7/KmekX/8rZmWNkCMw=;
 b=avIyU56ILm9ODI2GctAhor819SewvRxg0j6KdSag2BslaSJvw6cG97k+Il6HAyNsCX
 +FSUd8D+4Y3TA738pA4Z/VjUnLJZRR9rBFP0BdGDDKn4booC654SFxrodmRRfvdjW+gK
 /5dnd6D6BIOBe1yUtwTz06I7V2dVcC9QnqswotR4SGn2aH/xS34l2EtiKD7amh9tjmxQ
 eAnPzJTkedd+xHPtNkzOQ6AQ98D1jjPwuF66XOkHi7kmc62dw/YKtFp7qY/RygsUVISf
 jDV1au2pvjyhBdizr76pjnTug3EQ+DKtITmvgVVo4kMW14ApbCSK6Cr/fEH9wdjbtyms
 YGxw==
X-Gm-Message-State: AOJu0YyNpUYNU9dOQ5E1WeRBRESpQJj7O9JmGRFtSyVkcpEaWufAtPbi
 N6PZPnaHITG17kuZheGowi1EHFyonanCAWnsVFBfbtfM
X-Google-Smtp-Source: AGHT+IHaSpjbeAQ9UzHqXXC2nf4Z9xB3fbVm9xxQZ6RsAAdQhINpMo2utUL4uLzKK7MxM211qE78FA==
X-Received: by 2002:a05:6a00:124b:b0:68a:582b:44c4 with SMTP id
 u11-20020a056a00124b00b0068a582b44c4mr9603241pfi.3.1692891190414; 
 Thu, 24 Aug 2023 08:33:10 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:afa3:fcf5:1b7f:f7e2])
 by smtp.gmail.com with ESMTPSA id
 m30-20020a63711e000000b0056365ee8603sm11631337pgc.67.2023.08.24.08.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 08:33:09 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Thu, 24 Aug 2023 08:30:31 -0700
Message-ID: <20230824083012.v11.5.Ifadbfd45b22c52edcb499034dd4783d096343260@changeid>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824153233.1006420-1-dianders@chromium.org>
References: <20230824153233.1006420-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There's no reason why IPI_CPU_STOP and IPI_CPU_CRASH_STOP
 can't be handled as NMI. They are very simple and everything in them is
 NMI-safe.
 Mark them as things to use NMI for if NMI is available. Suggested-by: Mark
 Rutland <mark.rutland@arm.com> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
 Signed-off-by: Douglas Anderson <dianders@chromium.org> --- I don't actually
 have any good way to test [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.177 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.177 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qZCnX-00043s-5E
Subject: [Kgdb-bugreport] [PATCH v11 5/6] arm64: smp: IPI_CPU_STOP and
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
Cc: Ingo Molnar <mingo@kernel.org>, Valentin Schneider <vschneid@redhat.com>,
 ito-yuichi@fujitsu.com, D Scott Phillips <scott@os.amperecomputing.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
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
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I don't actually have any good way to test/validate this patch. It's
added to the series at Mark's request.

(no changes since v10)

Changes in v10:
- ("IPI_CPU_STOP and IPI_CPU_CRASH_STOP should try for NMI") new for v10.

 arch/arm64/kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index c8896cbc5327..4566934aaf9f 100644
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
2.42.0.rc1.204.g551eb34607-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
