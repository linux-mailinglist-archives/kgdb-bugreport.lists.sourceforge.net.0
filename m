Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A8A784C10
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 22 Aug 2023 23:31:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qYYxs-0004rG-Sg
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 22 Aug 2023 21:31:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qYYxr-0004rA-Iq
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 21:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sHNo52jMQHCTTXv1njx0att1y1oc+xWVwUeLIRRfBAg=; b=Kn6n6Nb93gotmidqGqT+GzwPl2
 TSlUHANetqv1MKw+iFWDhhJ7xH3B5ohIu4QmSPwQhlRfrBN3tmr5p4mbsVSiH4b9ohywntgi1GoHW
 3rVLLpxInoUKLFJpor49jbi90D0xqi93ckSIPhWUDYVm0lWwH0/EG8q+Q9OBxw93tzms=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sHNo52jMQHCTTXv1njx0att1y1oc+xWVwUeLIRRfBAg=; b=bkOByQM+AuKlU8b/Zf91gEZrYH
 BsgLGrN+fkRrLGD9iEj/rL/JIoMzocYh1vJu15EOSuPMCcz1cSkNSQc3mt/6BPUims1CbwBJUw7A2
 FW9u2zXysbXSFKo/i9aUKkVvIpA44H4acaFGHD+723FZ/bOpy9hNXSp64lE3difdzTqw=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qYYxo-00Cf67-Hi for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 21:31:03 +0000
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1bd9b4f8e0eso32570985ad.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 22 Aug 2023 14:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692739855; x=1693344655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sHNo52jMQHCTTXv1njx0att1y1oc+xWVwUeLIRRfBAg=;
 b=YC0PScEPND5aZfA24ZoaI8wC1TSlRy2EYibMqFd2iUs8w7ZRXT3RKFlha3o6KDnWYU
 nghvF99uhQidPrOCTS7kFbZPlAlehSol1ZWc0mEDaepO6A4obV5tBwUEQIFSbbZWPuUB
 UgSIx4tkrAH1Cw/lnH0Vt27I3n+AIHy+x0WXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692739855; x=1693344655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sHNo52jMQHCTTXv1njx0att1y1oc+xWVwUeLIRRfBAg=;
 b=ha8Uml5Esz4v04/3tFoWOp9IHU2VVKohGRIGnCs3sP62VDbXjHHCI76c7L4PE5cEzZ
 uKthrJxwzL9oaudqgLCsf/tjQ09I16QlkxyJVmPFWrITSCfzUGBwuJJZNQTt767NaoUQ
 ORUPcv7D54Q0ROxSreGH+jwFEEdVAaYtJAy3Dk9FukqGySPz0gLj2En3ndqbRAUk5vYl
 +7A1piH9+DvhHlFHA/Ht+M53e7Bekq/wte1N3lUG8rQnEKKGnXzUiIVqJi9/VkPLhvhG
 Q2azkH7mWPRn5E+grnCkUeAlEQSxnNHCKC8TG3a+n/zrVXzu3mbrO+KMGdn5t8HQ173q
 XdJQ==
X-Gm-Message-State: AOJu0Ywz3LCtaPvCvPsorVqTiF/XHmAer50UVThW5XMx/BDPJ06cQUhd
 05khv731vG97sKpKbe7JYehLHg==
X-Google-Smtp-Source: AGHT+IHswwKksNgSxyqElMvXEh66yr67LTxIGthRXPjy6R7WvznnHL9O4TkqksLBbcEBtlvUxYpXTg==
X-Received: by 2002:a17:902:e842:b0:1b8:63c6:84ab with SMTP id
 t2-20020a170902e84200b001b863c684abmr9273364plg.61.1692739854952; 
 Tue, 22 Aug 2023 14:30:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:83f0:2bc5:38c4:a9de])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a170902e84700b001befac3b3cbsm9451475plg.290.2023.08.22.14.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 14:30:54 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Tue, 22 Aug 2023 14:27:00 -0700
Message-ID: <20230822142644.v10.5.Ifadbfd45b22c52edcb499034dd4783d096343260@changeid>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230822212927.249645-1-dianders@chromium.org>
References: <20230822212927.249645-1-dianders@chromium.org>
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
 Rutland <mark.rutland@arm.com> Signed-off-by: Douglas Anderson
 <dianders@chromium.org>
 --- I don't actually have any good way to test/validate this patch. It's
 added to the series a [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.175 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qYYxo-00Cf67-Hi
Subject: [Kgdb-bugreport] [PATCH v10 5/6] arm64: smp: IPI_CPU_STOP and
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
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 D Scott Phillips <scott@os.amperecomputing.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Josh Poimboeuf <jpoimboe@kernel.org>, ito-yuichi@fujitsu.com,
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
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I don't actually have any good way to test/validate this patch. It's
added to the series at Mark's request.

Changes in v10:
- ("IPI_CPU_STOP and IPI_CPU_CRASH_STOP should try for NMI") new for v10.

 arch/arm64/kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 15b66dc1391b..c51d54019f5f 100644
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
