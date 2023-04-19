Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A636E85A0
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 20 Apr 2023 01:02:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ppGox-0003fP-QI
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 19 Apr 2023 23:02:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ppGow-0003fJ-LG
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g22FS7H3jiae+Nq35iKba9yRyiXUFZk5tjGcb2Ngrro=; b=CdaDrLlT2RS08birMIBPDY+REG
 WBHHL7IwM2iRhx2In0I+lL3lEEnVWVGsOJS2zi9NYffR/vhTEOMmCDxHg3y1RHNZ8fW67Wszje4TR
 T/XGSYNBKtTZPTS8XPK3KozwWq+Fj1E4h8qjgAiezujETA3/WdRXx8J2lCqFOWEHkL4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g22FS7H3jiae+Nq35iKba9yRyiXUFZk5tjGcb2Ngrro=; b=Vg9qHYOWZ2NVASXhDvOX9g3ZfE
 D6Oe9meTHq7+24U7rWg1QG+dWbHPNv4szw2pBMtJlXmNsmybvzLfdKR5YVm4KWn+mdv7KuYebBiZX
 PvHDCFf8oZ+MTnaQXvLhcen9DBtwVHDKoUd8/1XvIgr4BmlH7XLyYfBWMMIRuKiIcZVA=;
Received: from mail-yw1-f175.google.com ([209.85.128.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ppGos-0003Vq-GI for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:02:38 +0000
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-54fe25c2765so4004337b3.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 19 Apr 2023 16:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681945348; x=1684537348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g22FS7H3jiae+Nq35iKba9yRyiXUFZk5tjGcb2Ngrro=;
 b=A2wRzr9oC5FQpDJO/AIf8ji4X5QwkTxr7QwuCzE6nrkyq8HHU5jWNVVu1DSHZeQyGG
 Gh8dr3fN548C2u0gaIA0NS4hwSvDiLTiYDyWJ91vKQcjyqdWw5X38/8sCH8dKaozVn3q
 G2dQcc/J2Qo+qbNmegQdkRpNaOQXai2zyJyM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681945348; x=1684537348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g22FS7H3jiae+Nq35iKba9yRyiXUFZk5tjGcb2Ngrro=;
 b=gJODQLKJQqCnyJwoQFiTAvoM60+WUNq1Nh8p6uR0bcMquAVwcKe+7eVoRUkGT4SDXl
 M18Amf2J2PuXpwyHIIZgf4ftG3O7KGg6h1kmiuRW9UiKu9Xj9LQ8GsIhkQ1FwdP36Dvx
 UIlh+FzMCdtAFwj2AVu8diXVynFKycKsU/5JSgZUX69+yu/0HT5E40MtnM/rvT5Omt5A
 e7Iw/hCVZKrrwREsZXwF1jfmmc+lLdPJIa7KEA9cHIB68NFZNT1wvdHWjkfuckXhkcd8
 qtCwfV/6RoQC0UYwbRcjY1Rh3htoLGLLWjKgHfQCPyh65+qf2LKid8ty88OI9JGdTO0w
 Fjhw==
X-Gm-Message-State: AAQBX9dD802SDZyJQD4FRjYy491BSebBpcVdHskVoPv3ZQAxvsdQBfTw
 B2UxJjFqTuWQBq0AyAO35ijgH1AMbnszjkRqq9U=
X-Google-Smtp-Source: AKy350ZwQMfndFrterU/j3ICOpzairok4fxxMIEh8n95ls1l91IwUIv+MTPvdfsHLoUmgY2boXCeJA==
X-Received: by 2002:a17:90a:6707:b0:247:6619:61de with SMTP id
 n7-20020a17090a670700b00247661961demr4179810pjj.46.1681945037310; 
 Wed, 19 Apr 2023 15:57:17 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:8b1:fa03:670e:b784])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a17090aea8f00b00246ea338c96sm1847101pjz.53.2023.04.19.15.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 15:57:16 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Date: Wed, 19 Apr 2023 15:56:01 -0700
Message-ID: <20230419155341.v8.7.I21d92f8974c8e4001a5982fea6c98da1bed33ef5@changeid>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230419225604.21204-1-dianders@chromium.org>
References: <20230419225604.21204-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sumit Garg <sumit.garg@linaro.org> Add a new API
 kgdb_smp_call_nmi_hook()
 to expose default CPUs roundup mechanism to a particular archichecture as
 a runtime fallback if it detects to not support NMI roundup. 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.175 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ppGos-0003Vq-GI
Subject: [Kgdb-bugreport] [PATCH v8 07/10] kgdb: Expose default CPUs roundup
 fallback mechanism
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 ito-yuichi@fujitsu.com, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Sumit Garg <sumit.garg@linaro.org>

Add a new API kgdb_smp_call_nmi_hook() to expose default CPUs roundup
mechanism to a particular archichecture as a runtime fallback if it
detects to not support NMI roundup.

Currently such an architecture example is arm64 supporting pseudo NMIs
feature which is only available on platforms which have support for GICv3
or later version.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Tested-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 include/linux/kgdb.h      | 12 ++++++++++++
 kernel/debug/debug_core.c |  8 +++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 258cdde8d356..87713bd390f3 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -199,6 +199,18 @@ kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
 
 extern void kgdb_call_nmi_hook(void *ignored);
 
+/**
+ *	kgdb_smp_call_nmi_hook - Provide default fallback mechanism to
+ *				 round-up CPUs
+ *
+ *	If you're using the default implementation of kgdb_roundup_cpus()
+ *	this function will be called.  And if an arch detects at runtime to
+ *	not support NMI based roundup then it can fallback to default
+ *	mechanism using this API.
+ */
+
+extern void kgdb_smp_call_nmi_hook(void);
+
 /**
  *	kgdb_roundup_cpus - Get other CPUs into a holding pattern
  *
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index d5e9ccde3ab8..14d40a7d6a4b 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -238,7 +238,7 @@ NOKPROBE_SYMBOL(kgdb_call_nmi_hook);
 static DEFINE_PER_CPU(call_single_data_t, kgdb_roundup_csd) =
 	CSD_INIT(kgdb_call_nmi_hook, NULL);
 
-void __weak kgdb_roundup_cpus(void)
+void kgdb_smp_call_nmi_hook(void)
 {
 	call_single_data_t *csd;
 	int this_cpu = raw_smp_processor_id();
@@ -269,6 +269,12 @@ void __weak kgdb_roundup_cpus(void)
 			kgdb_info[cpu].rounding_up = false;
 	}
 }
+NOKPROBE_SYMBOL(kgdb_smp_call_nmi_hook);
+
+void __weak kgdb_roundup_cpus(void)
+{
+	kgdb_smp_call_nmi_hook();
+}
 NOKPROBE_SYMBOL(kgdb_roundup_cpus);
 
 #endif
-- 
2.40.0.634.g4ca3ef3211-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
