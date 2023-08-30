Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7334678DE9F
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 30 Aug 2023 21:14:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qbQdf-0001RC-7O
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 30 Aug 2023 19:14:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qbQdY-0001Qr-EV
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 30 Aug 2023 19:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qbk9s2ed2Gi+5NJ1qOCnDItkdATQhrhodWS8k0Aq0HQ=; b=GuowEttKctL5qpOcIcN4zyYmOb
 iOCH4LXkh9MbpIMeeKF8WUBRhw2rDaQpFrTaADf0IRCQP8F6vAwevGigMEuD6RjPJXN8uQJW8Vnbq
 9aWTm3MzchXRWZ2+41p+NI4luN7Yq3pNjNPnghtHWx+nQhXeURyr5fnSU1qbEAeXG7A8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qbk9s2ed2Gi+5NJ1qOCnDItkdATQhrhodWS8k0Aq0HQ=; b=YzJeHo/qKRN55LOUtFzLZIZDmv
 aqjttxfaf+TC4KxGZKpdAChaOY3WY+rTfPepo2dMqfFTkP6uUJx7BV8FyBf4DHBvEdwDZzmW1a1Dl
 1LZgmW3Bvc7iu+8aprOgkTK4zYTnCMcpMVaRcwTHigRQRAnfsQITj70M8psJnzsxajrM=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qbQdU-003sab-W2 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 30 Aug 2023 19:13:56 +0000
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-68a529e1974so915b3a.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 30 Aug 2023 12:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693422827; x=1694027627;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qbk9s2ed2Gi+5NJ1qOCnDItkdATQhrhodWS8k0Aq0HQ=;
 b=mFq3ygB9XI9ieBMrvRk3INzqHoG7ovzPeArfY32H5KNIO4d5b2XhrgHND4srVfG8Kj
 3Icu0jRTDNP+7MOmXJ5Isj04PEYLYCw/f221GtktYzdVChzRVZSG7BJKNBQ6mcOIevyt
 mqw5lxusBnId8cau/Kc3EzoOA3E0EZc4K4pdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693422827; x=1694027627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qbk9s2ed2Gi+5NJ1qOCnDItkdATQhrhodWS8k0Aq0HQ=;
 b=ltehvWZKSjSuUUH4HnhVTcI67TUsNgOMecdugwG9fM3uLMu6xW5DizkTAU93CBj5/y
 sTVix5Pt37fk7WQ6ogmenSw667m0SZBz1y/aU8V0icXMKZQcTDsYJe+2hUlUMkCVXRLo
 vZ6GtPSg9XVFGQpgLJW0Ov8a+VwwPVyUdA7nsCecJhRJ3BzfXGYFkFeq8L2JGm16HIc2
 O8yzzbHGGo5poquvz4srU8sHJ9YzkLz8mmqzAysDal9r3K7PbQNPmH2MAzZ93IfhVnaa
 SXsosuDQHjZjk+mCQDbRMaxbJrfmCKPuPtKeF14QNGYf9L+JFAfl5DqbMBUv0eQopZuj
 KFyg==
X-Gm-Message-State: AOJu0Yz0sT4X86KXfVYGqRL334tbffSDUEo9ohqGAMpmHFaiWK+oRKDn
 BPmMWaocFXepWQxZjZWRg2tNRA==
X-Google-Smtp-Source: AGHT+IHxDYoiWwRcFzk/j68VpzJh4FWcDcrG2boIQK6MYRCAWrovwACH3eHvWMJCrnBJyQGiUD8tUw==
X-Received: by 2002:a05:6a20:7f9b:b0:14c:40d1:e911 with SMTP id
 d27-20020a056a207f9b00b0014c40d1e911mr3916569pzj.42.1693422827426; 
 Wed, 30 Aug 2023 12:13:47 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e315:dec6:467c:83c5])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a170902d48f00b001bbdf32f011sm11338928plg.269.2023.08.30.12.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 12:13:46 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Wed, 30 Aug 2023 12:11:26 -0700
Message-ID: <20230830121115.v12.5.Ifadbfd45b22c52edcb499034dd4783d096343260@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230830191314.1618136-1-dianders@chromium.org>
References: <20230830191314.1618136-1-dianders@chromium.org>
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.171 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qbQdU-003sab-W2
Subject: [Kgdb-bugreport] [PATCH v12 5/7] arm64: smp: IPI_CPU_STOP and
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
Cc: Valentin Schneider <vschneid@redhat.com>, ito-yuichi@fujitsu.com,
 D Scott Phillips <scott@os.amperecomputing.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Stephane Eranian <eranian@google.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Tomohiro Misono <misono.tomohiro@fujitsu.com>,
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
