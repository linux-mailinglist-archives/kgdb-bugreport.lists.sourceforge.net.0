Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C857A222F6
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 29 Jan 2025 18:29:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tdBsA-0007Tb-29
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 29 Jan 2025 17:29:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1tdBs8-0007TS-3m
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 29 Jan 2025 17:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SlqbrB8qvt9xCnWbF/o5yExRVumEzsDKl37nom5IOEo=; b=KCCxS0oszIeVwbBcLxm3tm+rY1
 rQLPe/Z1PQshv7L5ndFGLpjdjG+gq747CtgT8pkgMfWZtD88us/U3GbkNaCPSxnaC0y7g8INm6GQu
 IfKANNwtzSc2FrYrx/RA6A7MMzxuJgIlwukbUEHA73Bp6ANe42bs48tU00CuCYa3yYPw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SlqbrB8qvt9xCnWbF/o5yExRVumEzsDKl37nom5IOEo=; b=fUjCquEFhsYLF1SrsuusEjoOuW
 htJEgAuT2KhakcvUqGXRY1R3PhtZLClaO3p/s5isAZVpdu1jpu7aOjTFdTmNk+EPSux9DpUHZ6uM/
 nrvR1IxYTGOBEBG+bJp+ba8upC3Kwj3U3O07clLfXF8/xce5eAsm+6J1BHfGv0F3QmMU=;
Received: from mail-qt1-f182.google.com ([209.85.160.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tdBs7-0006SP-6s for kgdb-bugreport@lists.sourceforge.net;
 Wed, 29 Jan 2025 17:29:04 +0000
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-46df3fc7176so64004331cf.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 29 Jan 2025 09:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738171737; x=1738776537;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SlqbrB8qvt9xCnWbF/o5yExRVumEzsDKl37nom5IOEo=;
 b=mjOEOXP+qVxWWRSVVQaGzCoIw0jbUSEmsD//qpc/VRfQxXVuXfuWE4NATyScUz0GTn
 VdLG82N6uNPq4Vkz+Sn/2fQ0lCnySYfShQrQBPK4uhqVaPuX2+v7E4KmTObTQ0FLhLD5
 C8yCGLcwAXM33fGcZPGSJU+XCSud40XFmzFps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738171737; x=1738776537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SlqbrB8qvt9xCnWbF/o5yExRVumEzsDKl37nom5IOEo=;
 b=kSdr1sUk2vp2IweehLgZxtX3Gpx3cQonu1dmkDggukKiwVjch9sc1JMWwRv1oi6bcE
 3mEHtDoizBYi2QCOo1HwbrJ0aEMOdBlNCuwaVqEU4oaKagTDjdX1fqeFq5sFAeOuCyhf
 /EbuRldxA3vGBg+/7BrUiI95Tf0GbfGXYDs4nrY5+0SM//r0diVIy7TLjfK0LRTz7DnB
 S5WA6oooNvqz/V4vvCu8S2TZeYsiwcDVnFKjCLg1UteJ5iTJAfJkpXRwpyk7nRm0Dy9O
 wrrzllHUon5e/9ppkz8ZddZnIA7Wu/UwpBpN43jTqdHIYCndZaVUn8hzQSTtaaxTImt/
 MS4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCo2Y+KPoO62gQrmPheJZjGiP+J1ENFFLl7slBujso0KZCI24eqancskT6MYZjKNCiwyTE7bAcm0ZuZyfC/w==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwNBc2si3yhrYVHH7+RSJPV7i4+pw90OXJiQGs8xBpJQYs4Y/Ze
 CQLAOXS7mWF9tOABtdVjRDAUdrcVPmL7uZnA3f+GoGIK/zV+lwJPAF09zJNu5/b9YRNBJlMibQY
 =
X-Gm-Gg: ASbGncvqUfFjit2e7TgtpMhOAnA3KLLpJzkqWR88KQNDVoVRXlBZds9JldWqMjW59i9
 amfkKHUjKi5vmklg9dsV/utmxqlF2YwlcxJ/vEOUY2v7k/qPt5bPPN1zASE5KW2kr1LcN9O3OZX
 szowTmUS2eCIVfyeJaxkIoRmfzSJ1bz9oQ0WskzFTrg5dB4KiBugX5WIOSZloOsQLF+Nr0xGvoV
 urVatUnjvkPoepJN8xgE9GOlO8SK0JZI1pOyVJYiZ0oq07x6ehbug+gtunhKTthdJkaE9ylIeqo
 5kmwz8ofaQL73aEGPGWTjn318R5iFSwX2JA=
X-Google-Smtp-Source: AGHT+IGwHJzqht4xgAE8aAHlAbgCQ+Cy1fdEcP9Joan7vjqiFIKdYsXcIDYJ2XLcGb2ysyVeLoX41A==
X-Received: by 2002:a05:6a20:12c1:b0:1db:e0d7:675c with SMTP id
 adf61e73a8af0-1ed7a4c9922mr7132442637.13.1738168054926; 
 Wed, 29 Jan 2025 08:27:34 -0800 (PST)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fa8a:f68a:6cb9:40b2])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac496cb4810sm10577009a12.66.2025.01.29.08.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 08:27:33 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Daniel Thompson <danielt@kernel.org>
Date: Wed, 29 Jan 2025 08:25:51 -0800
Message-ID: <20250129082535.2.Ib91bfb95bdcf77591257a84063fdeb5b4dce65b1@changeid>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
In-Reply-To: <20250129162700.848018-1-dianders@chromium.org>
References: <20250129162700.848018-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This reverts commit ad394f66fa57ae66014cb74f337e2820bac4c417.
 No architectures ever implemented `enable_nmi` since the later patches in
 the series adding it never landed. It's been a long time. Drop it. 
 Content analysis details:   (-1.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.182 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.182 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.182 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tdBs7-0006SP-6s
Subject: [Kgdb-bugreport] [PATCH 2/3] Revert "kdb: Implement disable_nmi
 command"
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
Cc: Nir Lichtman <nir@lichtman.org>,
 "Dr . David Alan Gilbert" <linux@treblig.org>,
 Zheng Zengkai <zhengzengkai@huawei.com>, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Anton Vorontsov <anton.vorontsov@linaro.org>,
 linux-serial@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Thorsten Blum <thorsten.blum@linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This reverts commit ad394f66fa57ae66014cb74f337e2820bac4c417.

No architectures ever implemented `enable_nmi` since the later patches
in the series adding it never landed. It's been a long time. Drop it.

NOTE: this is not a clean revert due to changes in the file in the
meantime.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_main.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 5f4be507d79f..3a5408b54570 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -25,7 +25,6 @@
 #include <linux/smp.h>
 #include <linux/utsname.h>
 #include <linux/vmalloc.h>
-#include <linux/atomic.h>
 #include <linux/moduleparam.h>
 #include <linux/mm.h>
 #include <linux/init.h>
@@ -2119,32 +2118,6 @@ static int kdb_dmesg(int argc, const char **argv)
 	return 0;
 }
 #endif /* CONFIG_PRINTK */
-
-/* Make sure we balance enable/disable calls, must disable first. */
-static atomic_t kdb_nmi_disabled;
-
-static int kdb_disable_nmi(int argc, const char *argv[])
-{
-	if (atomic_read(&kdb_nmi_disabled))
-		return 0;
-	atomic_set(&kdb_nmi_disabled, 1);
-	arch_kgdb_ops.enable_nmi(0);
-	return 0;
-}
-
-static int kdb_param_enable_nmi(const char *val, const struct kernel_param *kp)
-{
-	if (!atomic_add_unless(&kdb_nmi_disabled, -1, 0))
-		return -EINVAL;
-	arch_kgdb_ops.enable_nmi(1);
-	return 0;
-}
-
-static const struct kernel_param_ops kdb_param_ops_enable_nmi = {
-	.set = kdb_param_enable_nmi,
-};
-module_param_cb(enable_nmi, &kdb_param_ops_enable_nmi, NULL, 0600);
-
 /*
  * kdb_cpu - This function implements the 'cpu' command.
  *	cpu	[<cpunum>]
@@ -2836,20 +2809,10 @@ static kdbtab_t maintab[] = {
 	},
 };
 
-static kdbtab_t nmicmd = {
-	.name = "disable_nmi",
-	.func = kdb_disable_nmi,
-	.usage = "",
-	.help = "Disable NMI entry to KDB",
-	.flags = KDB_ENABLE_ALWAYS_SAFE,
-};
-
 /* Initialize the kdb command table. */
 static void __init kdb_inittab(void)
 {
 	kdb_register_table(maintab, ARRAY_SIZE(maintab));
-	if (arch_kgdb_ops.enable_nmi)
-		kdb_register_table(&nmicmd, 1);
 }
 
 /* Execute any commands defined in kdb_cmds.  */
-- 
2.48.1.262.g85cc9f2d1e-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
