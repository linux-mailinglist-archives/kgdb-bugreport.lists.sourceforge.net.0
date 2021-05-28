Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3732E396EA7
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  1 Jun 2021 10:17:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lnzaP-0003x1-7n
	for lists+kgdb-bugreport@lfdr.de; Tue, 01 Jun 2021 08:17:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gustavoars@kernel.org>) id 1lmifr-0005jN-Un
 for kgdb-bugreport@lists.sourceforge.net; Fri, 28 May 2021 20:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4/LWlahmh5RIE86HC08rqphTo1m850OzUY6n6OftBQQ=; b=ddZOVgtlbomZDylGZaEYABqmnJ
 PX8uYiS+8Greyz+Dld472zss5tcL803mBmxG1SV81cPDVsWTojTbvhy2J/kLYg3bMC9xfUX57rNOa
 Cyxa5erY0S4e/5agby1NAUMh0go7l7dLfqTKh7SNjMQexOJOrzRmwZrkYrSDxJoJn1lU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4/LWlahmh5RIE86HC08rqphTo1m850OzUY6n6OftBQQ=; b=V
 lE7gakRerUUCrzGMY1LqS4CnbIlb2q/433LBjpa74Yv6cuKD5NDxw0H1P5AygXmdIa2N/5ZLlNu/s
 hklzwPPmvh/2/azfyuUBQlP9NFoZD8cKXNDHTWRbaOPYX3dxmPhtwb1tIcprEnkxR3GKPUXOvZ3FF
 g0ysJJfAYdJcWYlo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lmiff-000137-Qz
 for kgdb-bugreport@lists.sourceforge.net; Fri, 28 May 2021 20:01:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A919613B5;
 Fri, 28 May 2021 20:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622232083;
 bh=I03wcNb7HMADoF0wf70BF8zVGLwCCpnsZRwVNuu0vmU=;
 h=Date:From:To:Cc:Subject:From;
 b=SXu5S8Xz1jWB0WbQf6s37rihBlTmvE6G94LYlmkOX/F8+Vj0H5QLS6df+Rx0l+b0X
 4T11rfIeM+UdGcrevpc9lXG33T6fPAxF9emZDJO3DWcXRm6Cm7pcccVWJv/Xd4WnKG
 4hL0fMRUYte/86On8o3aUyvZYifNwtGWSA6eIQrZ3DmsKQSoh6yZeKck1sVxckJx5f
 plGzcnMpmy3UCXj7jwdvPjENCQ7PC2j7SC10z4ANGR4PF/CIeDKKaRGCIlT0W/z5TY
 IgWorsrsOEjzKXM4kH4WOJfHGvxRq5NeXuItHpDXPSXHSN6trZjBu10iWQ9dqi3vox
 xZPfqYoEZUhCw==
Date: Fri, 28 May 2021 15:02:22 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Message-ID: <20210528200222.GA39201@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lmiff-000137-Qz
X-Mailman-Approved-At: Tue, 01 Jun 2021 08:17:14 +0000
Subject: [Kgdb-bugreport] [PATCH][next] kgdb: Fix fall-through warning for
 Clang
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

In preparation to enable -Wimplicit-fallthrough for Clang, fix a
fall-through warning by explicitly adding a goto statement instead
of letting the code fall through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
JFYI: We had thousands of these sorts of warnings and now we are down
      to just 25 in linux-next. This is one of those last remaining
      warnings.

 kernel/debug/debug_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 4708aec492df..431749dd9ab6 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -1038,6 +1038,7 @@ dbg_notify_reboot(struct notifier_block *this, unsigned long code, void *x)
 	switch (kgdbreboot) {
 	case 1:
 		kgdb_breakpoint();
+		goto done;
 	case -1:
 		goto done;
 	}
-- 
2.27.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
