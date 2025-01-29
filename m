Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5872CA22272
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 29 Jan 2025 17:59:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tdBPn-0006rL-5a
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 29 Jan 2025 16:59:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1tdBPe-0006r9-C7
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 29 Jan 2025 16:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GHZ2KPsF4COFgm+b5LCKQGhzh/Bu/7L9BM3q7wjetag=; b=G4Ow/Xpb1/k7bqcCUkNZded2ub
 fbf44U0vfAQzQ1k8/EKvGQtf1p1JJfT08NhTA7YNBHkJXRhpoVkAIMkIaHQGxPtr7+TgNF+0wRUC0
 v9dJnXt62vLMGUJjz/pYxpIrQ0LXUA41KfXu6b32JNQw5RPsPBWM0jGq7pMmlNcaLeXA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GHZ2KPsF4COFgm+b5LCKQGhzh/Bu/7L9BM3q7wjetag=; b=YyKeiVcNR3I8KIm+q41E0s+Z+Y
 QKu0RXYetcxigbe2gkqzvkeS4F8ReUB19OU5OorOGDBMRwe1jc6V9yprQhpDlHIvt+OGgjcrACGEs
 sPggyt4pMPdowdribfFLcFmeCuBh90c+w+4+ecVeEXP9j/Nx6H3B+2Y6W1C+7rBN03RU=;
Received: from mail-qv1-f44.google.com ([209.85.219.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tdBPd-0004El-CS for kgdb-bugreport@lists.sourceforge.net;
 Wed, 29 Jan 2025 16:59:37 +0000
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-6dd049b5428so55321116d6.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 29 Jan 2025 08:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738169971; x=1738774771;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GHZ2KPsF4COFgm+b5LCKQGhzh/Bu/7L9BM3q7wjetag=;
 b=hu7YrU+NuVjGC30pNjeR0eKCc0uv/JN03QrqytS4xIwgBziRZMdQY5BWarKFCt2QW2
 KEjBusu3GXtzj5TVeLvqMVNk7dOB9QXZDja3mqH4eHKm1gLbcOuGsIn0Pk3sl6RsWFgz
 snCY4hmZuXo42CyGgrJy837LOFV8h9O6URKnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738169971; x=1738774771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GHZ2KPsF4COFgm+b5LCKQGhzh/Bu/7L9BM3q7wjetag=;
 b=CAzqxBAqtA12pCIRknpaHnPrQCyA/PIQFIAe0unvRztOJbyrOyubBwJ6yDnxN2gYWA
 J2OkMmlKJNVxcoOi1C0MbW5A5jVPolfLtXBkfA3E7AsdOd+NRfz5l/qn8hNumvkEOcNk
 PxaTfAJnwJPbovpZKS/WaNwIzf+a2jxy9ftfLHES3Ixp2EGq+88rdoJjibKd4LZeBo9O
 sfT1oMVegx0R+LA+ZHcVK8EqXaqxxOlWHVoIZnSmsMIt3efT8Z9yxHKIhGO7KntoDQGp
 LYnqenWd0EFJeLCIsQ8V44IRcYSPXUpg9Ye3QNRykiRM4vFcJw0fkIc7N+DW6WcmQWb/
 g0mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV27UF0je9ZdaVMq02DvAZSfsbTmPOCAKr+pNhvMT5S0vHbFCS1qxoBjYioxPgoPqfjcyThIrFnR+9mYCZsyA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyQFt2UdaimGV1jrusFANmNJYhH+n/c+acHwMUyfLk7htuTo3K2
 UmGhA9lrPC3tbhv9TJR04xeOsdbr1A9Sf8FehpTC7+qdsX52Wy5b3arqkK8w5iH6gkOYqucaY40
 =
X-Gm-Gg: ASbGncvbI9zX3PcuvmMnCV51/NEh5lfynqwwIdekrg3pGrJFK4+n/3ro0M/er9bRf3I
 VsoAUYIwYZR+0rxVMGOWIO8/ThIPcfdYlj+zTmoHxbBvMnVdXdA8tOiYe/Ox2Ema4kYGQ1ClnkX
 dVGalfTOfFlk8J2h9iUWT+dewR5NyYNFL8liffNxnxZZDSLU6wN8MuYTXAu8yltLw7TmGddGSEb
 0ldpiheVp0KRuDaYc7SLruAOkhZlXwffqlGtqUAUjxRAWWI5OmkTeTqIPYuXloyoHNzqJ31QIeM
 WK1rK/ZaEH36TwHn0IURaxVr4dS2se0XfmU=
X-Google-Smtp-Source: AGHT+IEk/aQhe7EQCRd7H4ZWjZQuegTa1eAwg8ILNMsYIINEo4OJU9VMXs6WW1rI8GzMVr3E6kOBgg==
X-Received: by 2002:a05:6a21:b8a:b0:1ea:e7be:ff27 with SMTP id
 adf61e73a8af0-1ed7a5b6781mr6359250637.7.1738168056947; 
 Wed, 29 Jan 2025 08:27:36 -0800 (PST)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fa8a:f68a:6cb9:40b2])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac496cb4810sm10577009a12.66.2025.01.29.08.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 08:27:36 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Daniel Thompson <danielt@kernel.org>
Date: Wed, 29 Jan 2025 08:25:52 -0800
Message-ID: <20250129082535.3.I2254953cd852f31f354456689d68b2d910de3fbe@changeid>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
In-Reply-To: <20250129162700.848018-1-dianders@chromium.org>
References: <20250129162700.848018-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This reverts commit 5a14fead07bcf4e0acc877a8d9e1d1f40a441153.
 No architectures ever implemented `enable_nmi` since the later patches in
 the series adding it never landed. It's been a long time. Drop it. 
 Content analysis details:   (-1.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.219.44 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.219.44 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.44 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.44 listed in list.dnswl.org]
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tdBPd-0004El-CS
Subject: [Kgdb-bugreport] [PATCH 3/3] Revert "kernel/debug: Mask KGDB NMI
 upon entry"
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
Cc: "Dr . David Alan Gilbert" <linux@treblig.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Anton Vorontsov <anton.vorontsov@linaro.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This reverts commit 5a14fead07bcf4e0acc877a8d9e1d1f40a441153.

No architectures ever implemented `enable_nmi` since the later patches
in the series adding it never landed. It's been a long time. Drop it.

NOTE: this is not a clean revert due to changes in the file in the
meantime.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/kgdb.h      |  3 ---
 kernel/debug/debug_core.c | 14 +++-----------
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 14739952698b..5eebbe7a3545 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -257,7 +257,6 @@ extern void kgdb_arch_late(void);
  * hardware breakpoints.
  * @correct_hw_break: Allow an architecture to specify how to correct the
  * hardware debug registers.
- * @enable_nmi: Manage NMI-triggered entry to KGDB
  */
 struct kgdb_arch {
 	unsigned char		gdb_bpt_instr[BREAK_INSTR_SIZE];
@@ -270,8 +269,6 @@ struct kgdb_arch {
 	void	(*disable_hw_break)(struct pt_regs *regs);
 	void	(*remove_all_hw_break)(void);
 	void	(*correct_hw_break)(void);
-
-	void	(*enable_nmi)(bool on);
 };
 
 /**
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index ce1bb2301c06..0b9495187fba 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -837,10 +837,6 @@ kgdb_handle_exception(int evector, int signo, int ecode, struct pt_regs *regs)
 {
 	struct kgdb_state kgdb_var;
 	struct kgdb_state *ks = &kgdb_var;
-	int ret = 0;
-
-	if (arch_kgdb_ops.enable_nmi)
-		arch_kgdb_ops.enable_nmi(0);
 	/*
 	 * Avoid entering the debugger if we were triggered due to an oops
 	 * but panic_timeout indicates the system should automatically
@@ -858,15 +854,11 @@ kgdb_handle_exception(int evector, int signo, int ecode, struct pt_regs *regs)
 	ks->linux_regs		= regs;
 
 	if (kgdb_reenter_check(ks))
-		goto out; /* Ouch, double exception ! */
+		return 0; /* Ouch, double exception ! */
 	if (kgdb_info[ks->cpu].enter_kgdb != 0)
-		goto out;
+		return 0;
 
-	ret = kgdb_cpu_enter(ks, regs, DCPU_WANT_MASTER);
-out:
-	if (arch_kgdb_ops.enable_nmi)
-		arch_kgdb_ops.enable_nmi(1);
-	return ret;
+	return kgdb_cpu_enter(ks, regs, DCPU_WANT_MASTER);
 }
 NOKPROBE_SYMBOL(kgdb_handle_exception);
 
-- 
2.48.1.262.g85cc9f2d1e-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
