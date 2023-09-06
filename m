Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF207942AC
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  6 Sep 2023 20:03:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qdwsD-0006t6-Gl
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 06 Sep 2023 18:03:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qdvQ8-0003B5-2x
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 06 Sep 2023 16:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/7sZUrbu7G8VVQgLzNpnSnYE3JCJ+QM4RpfgS9EDo7w=; b=BKCDR24Q2qSJhwuyAsUd5xJort
 8EM/jS8E/+XQ29K1QO+pkB5tR77wzMutT8EM1xnnFkPtp5niiBm6WDEAtSNnNrT+3a4WXC1yoAQia
 /Zj9icZuUjUfWrnYIbnXNOlxh23qNmpz0O0lVGT9TM7sarovoa9ZoA8Rp2pyJasj5abQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/7sZUrbu7G8VVQgLzNpnSnYE3JCJ+QM4RpfgS9EDo7w=; b=G3tF88wlq6U4zT7/jl7RLBueic
 uUIrsndCJZDlvEsG01o970YiXjhgE1gQuU6W9qaiLVeTNle9OhVimyq8hVh2Ei/FUiYMZcwHFuDLl
 T7leNf5lkPhuNK8mRw2txZO1L5ZKaHpLKIHRok5Q7YoaHYzYi9BZTnaPuEX/HX3N37mk=;
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qdvQ5-00BRNF-Ok for kgdb-bugreport@lists.sourceforge.net;
 Wed, 06 Sep 2023 16:30:25 +0000
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1c06f6f98c0so30681475ad.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 06 Sep 2023 09:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694017816; x=1694622616;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/7sZUrbu7G8VVQgLzNpnSnYE3JCJ+QM4RpfgS9EDo7w=;
 b=XshSKNKbo9wUoiIu59PYh4Mwt//KRYMi2nJJc1PfLnkvjvKAbHfPo5zZfvwHlj4ZPA
 nE/GB162auko24pfogxIU0EaW7NgT1EVwGFyj+FmUHtlv++0nKP4MIyqfTb9E+DklSOZ
 M139uoQUbED8N8K2cTj5QWdmkvbFrvZTA6Ehk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694017816; x=1694622616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/7sZUrbu7G8VVQgLzNpnSnYE3JCJ+QM4RpfgS9EDo7w=;
 b=Vu2VoFQGFttGHAxu1UkoU+RIgyiT7OLmcM1wDMZyrVGrC1DhqX55nTOE8pVCmVtpJt
 N1FZh05HrUfws1LEzL4aOo/HthlbhSJdXxpiJzL6saX6s0jsf56eUuNsNPay57X87OSy
 SHwuWgVF/WuZlUMVr92SdPcwZxRr8AlqOUNoaCX8DFksSotfC02HVgTXNf3AEzxUjL1L
 57TqmCfG/gaZB6Gsu8FZfMwgSllr1ZZxzYPsZwrmLez1kq0aZ29/GIrEMGAtbW+Qna9u
 X6GIrLqxzhNSJ/CLaLassBBbRv4yP4/FEwq7N/SeegwxyxlBClahVaavebzY7uJY4bd1
 5KmQ==
X-Gm-Message-State: AOJu0YzgKBfmf3cPElNAQ+9XClNX8KEWFGdNyHAnlKViup045/32lGwx
 n+daNAl4TifxkjN3rDBlOxF/oAFRMHffcgCt6EaEMv9D
X-Google-Smtp-Source: AGHT+IE0tkbtilqmUzzNEAhkV7dwTH/WxCurwss0zjvA7YEgARbTqJ+cA+mwAwgj3wZJVcvv0hbP1A==
X-Received: by 2002:a17:90a:ec02:b0:267:f1d0:ca70 with SMTP id
 l2-20020a17090aec0200b00267f1d0ca70mr16136072pjy.47.1694016379780; 
 Wed, 06 Sep 2023 09:06:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4a07:e00a:fdae:750b])
 by smtp.gmail.com with ESMTPSA id
 ju19-20020a170903429300b001b8c689060dsm11338859plb.28.2023.09.06.09.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 09:06:19 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Wed,  6 Sep 2023 09:03:02 -0700
Message-ID: <20230906090246.v13.7.I625d393afd71e1766ef73d3bfaac0b347a4afd19@changeid>
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
 Content preview: Mark the three IPI-related globals in smp.c as
 "__ro_after_init"
 since they are only ever set in set_smp_ipi_range(), which is marked "__init".
 This is a better and more secure marking than the old "_ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.179 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.179 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qdvQ5-00BRNF-Ok
Subject: [Kgdb-bugreport] [PATCH v13 7/7] arm64: smp: Mark IPI globals as
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

Mark the three IPI-related globals in smp.c as "__ro_after_init" since
they are only ever set in set_smp_ipi_range(), which is marked
"__init". This is a better and more secure marking than the old
"__read_mostly".

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
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

(no changes since v12)

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
