Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CB01EF8DE
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 Jun 2020 15:22:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jhCJ0-0007QM-1D
	for lists+kgdb-bugreport@lfdr.de; Fri, 05 Jun 2020 13:22:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jhCIr-0007ON-6t
 for kgdb-bugreport@lists.sourceforge.net; Fri, 05 Jun 2020 13:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xAlKxt3CeRGgnokjPKgwbHDWms7QUL6gxBaF1E7hzHQ=; b=ZCVeLEzDtEaWlR0P93ta3bvu5E
 IY+BPXwu7XMgEqDB8ua8A21wkwPG7MSyR6xfR6U9JK1QFiGykw1UIhphkdFvUHTwG03qmE/SLHgS6
 /QS3JGiwSjPyFvGf+WnjENrWy80A8MxOzJqexndnb6kgVnM3rMuXpuAGenriwnWOVmzQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xAlKxt3CeRGgnokjPKgwbHDWms7QUL6gxBaF1E7hzHQ=; b=mUjAlNL3pwLEopBP/V5ok4Ms0L
 4tl5AjYLklEFY6Wu1a6SkIZ9VI/oqssYMT6TnK7XeqWOEEWYJvPF+Axs0QrrF+5F2tusueTfHi28y
 yMtNHkW4GjVyeGLmiCnyGtmy+MWWoCUDiayoXqbGvg14IeTXzh53NFz6BqqTqBoVSkEw=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jhCIn-006wqD-Pd
 for kgdb-bugreport@lists.sourceforge.net; Fri, 05 Jun 2020 13:22:33 +0000
Received: by mail-wm1-f66.google.com with SMTP id q25so9128435wmj.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 Jun 2020 06:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xAlKxt3CeRGgnokjPKgwbHDWms7QUL6gxBaF1E7hzHQ=;
 b=yYiav+kMyZ2Ix7WiVK7dI5HnTMjAng05HBGjcV43tWiZ6XDmWimy/6ZQNI7sxlIeF0
 ny/pb2rEHxegQzT78UTHLx57Bavu+D8NPjlonHJRBg6EZ9iiNlX+eQ7e1zjdEgQSejc6
 f20Onq0IJRAlGwXVdIKKG73OrUMooHFJPdDDKhBMmrFbRI7PzSYUnX5X7YwtML9MBhpb
 N6Ue6HDCNLoLE/Pwz9P/J0wj27Hid2yPPeQdp0icf93cf5xbDIpv2D/dhNngYGAyL/sg
 bDY9CaZ+0Fse6H5ZAjs5SGLwks3JyrNKZq5zD9AEb66Zor5YraVenWPJFPis3j/fjPgY
 0C8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xAlKxt3CeRGgnokjPKgwbHDWms7QUL6gxBaF1E7hzHQ=;
 b=p5zFtb+4qVGHQhkWabx++ug5kpgdNu8gpbM7++fzcc4dx7WP8w53I1DBihyhNymsy3
 KdnuO09eAT4rYECoi9SFLqFrhsQ5g7WCBT2sYwVOcisVFfPVrblLIEkfVQbPRbT/UQsN
 i7Fy5p7raMhBDlhtLS0CTygFtW3klbsImJCx6Gt+xueW7MjUZ31aYjOUbhizaecCUp2x
 Bwvz2lVw0gi7d8MrvjO7591axKnjxA3efHcpLGdv4Xq/vU/mHEXCvOrxs4pU18xquypi
 bGyEHg5iRM8fvWEjOdjIRQO871Yit084t5KeD9pf2yS4JN+ewbJXDP180zvgAOp1aCHG
 kWHA==
X-Gm-Message-State: AOAM531IiIzw43HGQOIrRO8zCPPb5jDv2+I/yOJXqatTliKRQT0eHnlx
 b0wD4lw3IpeHh6scdJdTNHx/Wg==
X-Google-Smtp-Source: ABdhPJyt8YO6c3MFb5eo6VCQfHwV4YCdIkN/j71Gnogub1Z5Ahg9B5DQxJEiYFr2NP7rx7grZEK9JQ==
X-Received: by 2002:a7b:c0cc:: with SMTP id s12mr2780173wmh.111.1591363343349; 
 Fri, 05 Jun 2020 06:22:23 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 1sm11419211wmz.13.2020.06.05.06.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:22:22 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Fri,  5 Jun 2020 14:21:27 +0100
Message-Id: <20200605132130.1411255-2-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200605132130.1411255-1-daniel.thompson@linaro.org>
References: <20200605132130.1411255-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jhCIn-006wqD-Pd
Subject: [Kgdb-bugreport] [RFC PATCH 1/4] kgdb: Honour the kprobe blacklist
 when setting breakpoints
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, pmladek@suse.com,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 patches@linaro.org, linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently kgdb has absolutely no safety rails in place to discourage or
prevent a user from placing a breakpoint in dangerous places such as
the debugger's own trap entry/exit and other places where it is not safe
to take synchronous traps.

Modify the default implementation of kgdb_validate_break_address() so
that we honour the kprobe blacklist (if there is one). The resulting
blacklist will include code that kgdb could, in fact, debug but I think
we can assume that anyone with sufficient knowledge to meaningfully
debug that code would trivially be able to find and remove the safety
rail if they need to.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/debug_core.c | 11 +++++++++++
 kernel/debug/kdb/kdb_bp.c |  9 +++++++++
 2 files changed, 20 insertions(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index ef94e906f05a..81f56d616e04 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -56,6 +56,7 @@
 #include <linux/vmacache.h>
 #include <linux/rcupdate.h>
 #include <linux/irq.h>
+#include <linux/kprobes.h>
 
 #include <asm/cacheflush.h>
 #include <asm/byteorder.h>
@@ -188,6 +189,16 @@ int __weak kgdb_validate_break_address(unsigned long addr)
 {
 	struct kgdb_bkpt tmp;
 	int err;
+
+	/*
+	 * Disallow breakpoints that are marked as unsuitable for kprobing.
+	 * This check is a little over-zealous because it does include
+	 * code that kgdb is entirely capable of debugging but in exchange
+	 * we can avoid recursive trapping (and all the problems that brings).
+	 */
+	if (within_kprobe_blacklist(addr))
+		return -EINVAL;
+
 	/* Validate setting the breakpoint and then removing it.  If the
 	 * remove fails, the kernel needs to emit a bad message because we
 	 * are deep trouble not being able to put things back the way we
diff --git a/kernel/debug/kdb/kdb_bp.c b/kernel/debug/kdb/kdb_bp.c
index d7ebb2c79cb8..ec4940146612 100644
--- a/kernel/debug/kdb/kdb_bp.c
+++ b/kernel/debug/kdb/kdb_bp.c
@@ -306,6 +306,15 @@ static int kdb_bp(int argc, const char **argv)
 	if (!template.bp_addr)
 		return KDB_BADINT;
 
+	/*
+	 * This check is redundant (since the breakpoint machinery should
+	 * be doing the same check during kdb_bp_install) but gives the
+	 * user immediate feedback.
+	 */
+	diag = kgdb_validate_break_address(template.bp_addr);
+	if (diag)
+		return diag;
+
 	/*
 	 * Find an empty bp structure to allocate
 	 */
-- 
2.25.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
