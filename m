Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0AC2FFFC9
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 Jan 2021 11:09:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l2tNX-0003Dr-7j
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 Jan 2021 10:09:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1l2tNV-0003Dj-CG
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 Jan 2021 10:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5XkfPIeaOJLsy0Tv+oZGNxT8cNyK2rUePBRvJsE8fKA=; b=G5B1/KoCxX2UakjNZnrOrotF+T
 XUQ3/8mF8aaVYbak1hN9Va8lE7Pdv3c6H9Gs7H+smwIaPygJ/376ukR28nN+PajjSoRglFPT9O0yj
 KPjjbxIflO12wTukrzpiRsM5EdQuHUgEZ5nffXBId9KKHV0DfiFJPJ4lyZHqjz10CirA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5XkfPIeaOJLsy0Tv+oZGNxT8cNyK2rUePBRvJsE8fKA=; b=C8yDRHKELaRSW0SCBTrJOX2Jg8
 JGopmIZf3pCdnPyglkzurW353TusxPdz40xFysv9hkgW6Vtg5wwJNr/yofNcCnWj6dIqMGNzJFbXb
 iJJArjwPVo3jI0bMfPyWy2vo0Hk7ZMtMkQnblsgDxVMhO/neKlmqC4qFopgyh7VhLstU=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l2tND-009XOK-PF
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 Jan 2021 10:09:17 +0000
Received: by mail-pf1-f179.google.com with SMTP id f63so3361552pfa.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 Jan 2021 02:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=5XkfPIeaOJLsy0Tv+oZGNxT8cNyK2rUePBRvJsE8fKA=;
 b=hh6PmUhwxLRoyQ/oYOx+tc2FT99ESSRDcHrUQuCUnmt1POfYLRkHJzzroCEVrCArrH
 Ogk0tzqX+rO/FTJA86Lx9TT5HAM+RBM3Th9/Wk4W9cjBhTNNAkkt8oOJdUghNuNSIl7F
 3GWARhehbMK/YFBoecnfuxZIZCwGm9SNDuLNxW2Uy1tP+GuN4xe5/e2xcoN4KH5qaAJQ
 Mgy3eknMBe5cYRzlPkw4/FvlgXWHNuT8Sf1RBkoBQ3KFHchAqLYYnYxVEDGRPC3gJ0xa
 0nTukggDzea0NV8Jpiuatf9HaEzcf4hPgqPBzN5mhr8MXkM9c+53Nk0SfdjjMhgNI5mi
 s0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5XkfPIeaOJLsy0Tv+oZGNxT8cNyK2rUePBRvJsE8fKA=;
 b=gtKtx26AskNEAJmyn2lIdF48HpX9xTbn3/3QLaFpDDPq4cJ/dZMEFqKDHC3rdSCPg6
 zW48XbsuLdWZSkmbMVt3BnqB2CtYiDe6BlRHCG8sqsBypgTtypQkrWj8OVN2FzG/ZMfO
 fT+7tO8BBbEmz4Rx4fSJw/Nq9h+JUvpHDr0mPDdDMFNToLjUKsbFyyC7XVJACM6mybVq
 xsCvvuyRFb13R1rUm6/hRGaJnk+H8vMn2kAirHWAeYhfvUEymp2oI3QRGfzpYvKTaZkt
 6qoWupC2w1qiqC6dXdgQ8XW+yxpxhFZJ8rXzDX0pkRgLAaUpmU0X6yX4FVa7tzgom16V
 E0pg==
X-Gm-Message-State: AOAM530f1L1AWNTRO7dieTxciAx1pCAtFz5h+w/M0bL87dnMFUbDMzzN
 k8jFOxIMAkDdHEEpjpX1mq7+c6IfZaJsUQ==
X-Google-Smtp-Source: ABdhPJzvUWzsIHNQPvEPrBlano9vEd2rYgUsgOyBcrkbE0eYZBzSqTClmrX9Cd7jS7BLSBuAklpNrw==
X-Received: by 2002:a62:5b07:0:b029:1ae:177d:69e1 with SMTP id
 p7-20020a625b070000b02901ae177d69e1mr3853738pfb.25.1611308333324; 
 Fri, 22 Jan 2021 01:38:53 -0800 (PST)
Received: from localhost.localdomain ([122.173.53.31])
 by smtp.gmail.com with ESMTPSA id y26sm8543616pgk.42.2021.01.22.01.38.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 01:38:52 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Fri, 22 Jan 2021 15:08:31 +0530
Message-Id: <1611308311-2530-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [122.173.53.31 listed in dnsbl.sorbs.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.179 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l2tND-009XOK-PF
Subject: [Kgdb-bugreport] [PATCH] kdb: Make memory allocations more robust
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

We can improve this by adding check for in_dbg_master() which explicitly
determines if we are running in debugger context. Also, use in_atomic()
instead of in_interrupt() as the former is more appropriate to know atomic
context and moreover the later one is deprecated.

[1] $ echo g > /proc/sysrq-trigger

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 kernel/debug/kdb/kdb_private.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index 7a4a181..7a9ebd9 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -231,7 +231,7 @@ extern struct task_struct *kdb_curr_task(int);
 
 #define kdb_task_has_cpu(p) (task_curr(p))
 
-#define GFP_KDB (in_interrupt() ? GFP_ATOMIC : GFP_KERNEL)
+#define GFP_KDB (in_atomic() || in_dbg_master() ? GFP_ATOMIC : GFP_KERNEL)
 
 extern void *debug_kmalloc(size_t size, gfp_t flags);
 extern void debug_kfree(void *);
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
