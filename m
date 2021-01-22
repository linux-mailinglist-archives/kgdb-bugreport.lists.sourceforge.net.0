Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3F33000BE
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 Jan 2021 11:54:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l2u5U-0000CZ-Sg
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 Jan 2021 10:54:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l2u5T-0000CO-Oa
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 Jan 2021 10:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XoFMW3OnfJNPPFldVSvQQaSFejRFNATBngl33Eh4QXM=; b=TrM8qi3zDSyG1Oj4sVReDigBTE
 LtcTICQjfNM2MtCma7rlBrPbGAYqJLKxgwyAI1uvUl+CXBYqx9IT23V+Q7dxj+8UbdWEoHUGMD/hV
 oZdOUUP18RlJm67ZVocUx96jgkuV3H+903O/0xgtWV29l0Gbydi38Ix/Rk4WaieB052s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XoFMW3OnfJNPPFldVSvQQaSFejRFNATBngl33Eh4QXM=; b=nFJXpJZhRtxpDZ/Z6pBZ7IihMP
 lXiPeUa+BDBDlSvzS2Yz5K3sUH3Rf26jdUr7ypL9CbpqeUggnEOWFDMOfupD5YZ8R6P7jrA5K+V7N
 JU3QyLoTB71ATqy1ku7SndRBfJOGkHz1oqE4Xq2xvl+X/WK5EnJ/u0LBVMD9hf5L9n3E=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l2u5H-00G7OJ-Vf
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 Jan 2021 10:54:43 +0000
Received: by mail-pl1-f182.google.com with SMTP id b8so2997255plx.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 Jan 2021 02:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=XoFMW3OnfJNPPFldVSvQQaSFejRFNATBngl33Eh4QXM=;
 b=ZSWzskGWJQHTWK8xCE0MwgJkMnc94cSw/xSZAitSkx1ocOp67NrLdmveru5Jfn5jJr
 AFQn+XTyax+ZDbHMFjPyaCHwhO9euQMT8ZoQ2dnOHNu51obRl8NO+pQ+XGYGMOtp1kVW
 2/UUEQhJ9nrY0FuV0NDAqXBYBxDkWc/0HFLYHatQD6VnqJKIgpBVV02nsIVPY5I6Fjcl
 YqEyeZBDTn4B9uftmeR0SNIwjNXlUgZKkJ+9pHP7/Fa4SyDVHXXRuVpCzhx95mAPmAoA
 zD+qQ/8VdloWls+4lRhfzcxZiX+GuTS4WcV0XAQk+dMGGV3aDupkjx9Qo51hgWkhn0Xr
 ibJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XoFMW3OnfJNPPFldVSvQQaSFejRFNATBngl33Eh4QXM=;
 b=gk3Yk+ZgoxIwf0flEO93xmLT/krUyqTzfNV7G3rISRBd6xY3pZwCnpl2l28kRsP8o3
 NNpbFokoWUnMMDDp7rfeM907a+5nptiMDN+iphQug6CRPlGEqvv/dyryUhwNcyc5JgXs
 X4tkPsw90/w16T9reovghW9T/Luy0JW5e8i4a9elxgoN0cpqU5Ae+QIpM/ENg7UZkiWl
 udYHYHPIDxfdvZrbbe6Mm+GrKgAeOgKawAawYV2q1YBa9Z9IjUuI5IlFBqXxVd+mqofT
 snXy+NpogbgySOf646vsRYIXnlohUXhfR9wyXeFr4q+hRiZXsaHDvOo4LTU0+PpScGBB
 DtlQ==
X-Gm-Message-State: AOAM530himPP3sUCzAUzUsKKj+M6/n2Tw10r8qcXD1fCif/FwhMvAllY
 q9Uji1AFio3NVP/2rKfjGgacVE0pD+WWnw==
X-Google-Smtp-Source: ABdhPJzRoAHA3V2OMWAaOdw8coCyBE2IHrTcMy8kprKt4kCmC5DwgsnYIdx2PH4Lqtn4pdxX8zUBjA==
X-Received: by 2002:a17:902:bc41:b029:de:1ec2:dac1 with SMTP id
 t1-20020a170902bc41b02900de1ec2dac1mr4244934plz.9.1611310866648; 
 Fri, 22 Jan 2021 02:21:06 -0800 (PST)
Received: from localhost.localdomain ([122.173.53.31])
 by smtp.gmail.com with ESMTPSA id ne6sm8487557pjb.44.2021.01.22.02.21.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 02:21:05 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Fri, 22 Jan 2021 15:50:50 +0530
Message-Id: <1611310850-3339-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [122.173.53.31 listed in dnsbl.sorbs.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l2u5H-00G7OJ-Vf
Subject: [Kgdb-bugreport] [PATCH v2] kdb: Make memory allocations more robust
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
Cc: linux-kernel@vger.kernel.org, daniel.thompson@linaro.org,
 jason.wessel@windriver.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently kdb uses in_interrupt() to determine whether it's library
code has been called from the kgdb trap handler or from a saner calling
context such as driver init. This approach is broken because
in_interrupt() alone isn't able to determine kgdb trap handler entry via
normal task context such as [1].

We can improve this by adding check for in_dbg_master() instead which
explicitly determines if we are running in debugger context.

[1] $ echo g > /proc/sysrq-trigger

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Changes in v2:
- Get rid of redundant in_atomic() check.

 kernel/debug/kdb/kdb_private.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index 7a4a181..344eb0d 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -231,7 +231,7 @@ extern struct task_struct *kdb_curr_task(int);
 
 #define kdb_task_has_cpu(p) (task_curr(p))
 
-#define GFP_KDB (in_interrupt() ? GFP_ATOMIC : GFP_KERNEL)
+#define GFP_KDB (in_dbg_master() ? GFP_ATOMIC : GFP_KERNEL)
 
 extern void *debug_kmalloc(size_t size, gfp_t flags);
 extern void debug_kfree(void *);
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
