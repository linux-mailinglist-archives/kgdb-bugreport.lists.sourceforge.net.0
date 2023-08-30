Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AD778DEA0
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 30 Aug 2023 21:14:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qbQdg-0007sd-A0
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 30 Aug 2023 19:14:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qbQdd-0007sM-Ol
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 30 Aug 2023 19:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lm34Kk+maPdNp9rFuwAAy5O1fZmlUwsB3d8wqfk31DQ=; b=WWNYPYu+ecHrEwU5byk8WUC1qO
 KB8rfOVFuwjX8ah+w4wRpNxGtvpIxEodRsOu+M6FLhmnI4OBu5SGSrEDcPii5CzUjxd43zaI4etWY
 hl/KphmCg40DxTHerTdOrtoNTGlHLLm8aPp2g/SAU2gEMzoELseRIIv7GyaUK88a2qrM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lm34Kk+maPdNp9rFuwAAy5O1fZmlUwsB3d8wqfk31DQ=; b=R3jsogsSO+jvn6tUwvkxLyQ6RO
 ou4JwsEPDim+bp7t/eSsUHs+Vxa+7LbCyFEP2Vb7MoW3RVTqKW3utKTGwllnuKJCvHzbIGXNugeh4
 vScqUv1x5tYbC+sV8QG/TSjddLk4BqP++74GE/TfI/f9bGE/1ONDQhVTEiQyWyjqwsao=;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qbQdb-0003sA-0Y for kgdb-bugreport@lists.sourceforge.net;
 Wed, 30 Aug 2023 19:13:59 +0000
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1c22103bce7so32805ad.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 30 Aug 2023 12:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693422833; x=1694027633;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lm34Kk+maPdNp9rFuwAAy5O1fZmlUwsB3d8wqfk31DQ=;
 b=RXkplKaQPbJuXG8ucy9fAKtM1ulYFYkXAMi/PG0Z6iPfJS0jvidgnv/ShnjHt7BsdO
 kI1BJiCJe/mirE3xgJT3c7wq3OM8SFp5AOuODTihZzBQMiG2JYjec9wHJ5kO2UjDsMax
 pGrzWsqSM79CyQStq466Pb03+mel7GQR0I7uM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693422833; x=1694027633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lm34Kk+maPdNp9rFuwAAy5O1fZmlUwsB3d8wqfk31DQ=;
 b=GmU+K3eDsyfbRuJ4k7qnjvHWoH6y5qb1Q1qR6+YsYgPd/APA7nymtcGfhbIUTKEank
 uvPraEXiFgjZk33Acb5g7CWlvIiiDWZN5ESWCyqWnPMuAzPWBRzeN6wkCix9+5SwIQH/
 OL/bU68pNbDyVtrwE7sbTdMAu0saUcdxUZtZRM8rElguD9TNiWwa2OGComiJSiTj3ubK
 duEQcQasUMaUHqCY7jB+0sflaqqDQ/0m/vOL/oO9a7O82edpNAlfKbuFsPcCkXsd5wnr
 8poeixzoEjUuWTT30/STm4xA4uBlq0t3IT2999FTndaKXqgT1pUZvnrPsnp5K/0hgLiN
 O0gw==
X-Gm-Message-State: AOJu0YzATwUlESgs2YupfKr4gUOVegbbBcl9pLCK/vzY1bHWOhtXpriY
 nt4eJEh43i4VZBYNut0xDe7vnA==
X-Google-Smtp-Source: AGHT+IEt4V9Q3kKv3ps387mUFelpzuS3AhZ1ooWe7nWHiUV3yMAAUWymDyit8Cg7nWN79LlkVQ4iHQ==
X-Received: by 2002:a17:902:b18d:b0:1b5:1467:c4e8 with SMTP id
 s13-20020a170902b18d00b001b51467c4e8mr2658054plr.15.1693422833430; 
 Wed, 30 Aug 2023 12:13:53 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e315:dec6:467c:83c5])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a170902d48f00b001bbdf32f011sm11338928plg.269.2023.08.30.12.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 12:13:52 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Wed, 30 Aug 2023 12:11:28 -0700
Message-ID: <20230830121115.v12.7.I625d393afd71e1766ef73d3bfaac0b347a4afd19@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230830191314.1618136-1-dianders@chromium.org>
References: <20230830191314.1618136-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Mark the three IPI-related globals in smp.c as
 "__ro_after_init"
 since they are only ever set in set_smp_ipi_range(), which is marked "__init".
 This is a better and more secure marking than the old "_ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.181 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.181 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qbQdb-0003sA-0Y
Subject: [Kgdb-bugreport] [PATCH v12 7/7] arm64: smp: Mark IPI globals as
 __ro_after_init
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

Mark the three IPI-related globals in smp.c as "__ro_after_init" since
they are only ever set in set_smp_ipi_range(), which is marked
"__init". This is a better and more secure marking than the old
"__read_mostly".

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This patch is almost completely unrelated to the rest of the series
other than the fact that it would cause a merge conflict with the
series if sent separately. I tacked it on to this series in response
to Stephen's feedback on v11 of this series [1]. If someone hates it
(not sure why they would), it could be dropped. If someone loves it,
it could be promoted to the start of the series and/or land on its own
(resolving merge conflicts).

[1] https://lore.kernel.org/r/CAE-0n52iVDgZa8XT8KTMj12c_ESSJt7f7A0fuZ_oAMMqpGcSzA@mail.gmail.com

Changes in v12:
- ("arm64: smp: Mark IPI globals as __ro_after_init") new for v12.

 arch/arm64/kernel/smp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1a53e57c81d0..814d9aa93b21 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -84,9 +84,9 @@ enum ipi_msg_type {
 	MAX_IPI
 };
 
-static int ipi_irq_base __read_mostly;
-static int nr_ipi __read_mostly = NR_IPI;
-static struct irq_desc *ipi_desc[MAX_IPI] __read_mostly;
+static int ipi_irq_base __ro_after_init;
+static int nr_ipi __ro_after_init = NR_IPI;
+static struct irq_desc *ipi_desc[MAX_IPI] __ro_after_init;
 
 static void ipi_setup(int cpu);
 
-- 
2.42.0.283.g2d96d420d3-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
