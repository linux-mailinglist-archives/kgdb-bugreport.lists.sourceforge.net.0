Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A991F7F8A78
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 25 Nov 2023 13:05:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1r6rPW-0001gN-9R
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 25 Nov 2023 12:05:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <christophe.jaillet@wanadoo.fr>) id 1r6rPR-0001g7-Tv
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 25 Nov 2023 12:05:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D8jRKKW7qYyj5J7AMcOnTnbOZsoLLJ3CuZOXne3T+xE=; b=e3+PJJGYJBwU26ZwqvyKA11iE4
 jEXaP3NRlEAC80TBxRGVLL93L/1AdNqp1NCS83g3v5VIIjleRvJO1UL6ebX1wWt0Eg583uUuoROH7
 iPnc7bfdk7y1NPMvsCegXTWPLw3lxpG85xw/KY1DFxC140sni62pVY0iUOwvdtLxAEDA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=D8jRKKW7qYyj5J7AMcOnTnbOZsoLLJ3CuZOXne3T+xE=; b=c
 vO05eVHogqaj60JWzDrKlAvKLcqhrv09CS9+hC1KHdXI3au2Z1Mdd71yYQs4EKSrwJDQWJGTHYVbW
 yv0iWUmetmHKbBN82Cq+jUF4oJObLom7p6A6yJssbu1q5kxYQhmQwYfVZxTJfXYcT1WFzH2P/QLAW
 DUE+PmUK3l5rfZ0M=;
Received: from smtp-18.smtpout.orange.fr ([80.12.242.18]
 helo=smtp.smtpout.orange.fr)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r6rPO-00F16d-HY for kgdb-bugreport@lists.sourceforge.net;
 Sat, 25 Nov 2023 12:05:18 +0000
Received: from pop-os.home ([92.140.202.140]) by smtp.orange.fr with ESMTPA
 id 6rPGrkVZQMoj46rPGrYOrl; Sat, 25 Nov 2023 13:05:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1700913907;
 bh=D8jRKKW7qYyj5J7AMcOnTnbOZsoLLJ3CuZOXne3T+xE=;
 h=From:To:Cc:Subject:Date;
 b=FpZCFyMhyfkRQVTlJ+ul3K9wjaFgrtqzimdWGweVS/sVW5yp047fClM6sgjK4qoLo
 BFv3hWrTDEW4138OnhsK5IGjpj48AmQGQ5LTTR4pFERCD/ib/XfiNJLBdQuBrDpX2S
 hV8e4JUq/z/s2hYuYIvhPF5d8OqOgyE2AUbvNv2Mu7j9/WVOzsNy15QeLgLf1P4MKE
 WmPEigmenEo5j42E04jl2HMYeyq2sguWOPiTmo70ebZzBZoRb2GciK6FSuo1twSShn
 +gz0Ux5v0TSvc93oqlD20I7ntiK5lD7Dpr6AJJoidrlcCITvFTg4QUji+tv2OPPN4P
 Aug0puK1mLLrg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 25 Nov 2023 13:05:07 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Martin Hicks <mort@sgi.com>
Date: Sat, 25 Nov 2023 13:05:04 +0100
Message-Id: <dfb1a9a26d7f974371ff1d3e29eba80ef075d465.1700913863.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When appending "[defcmd]" to 'kdb_prompt_str', the size of
 the string already in the buffer should be taken into account. An option
 could be to switch from strncat() to strlcat() which does the correct test
 to avoid such an overflow. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [80.12.242.18 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [80.12.242.18 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r6rPO-00F16d-HY
Subject: [Kgdb-bugreport] [PATCH v2] kdb: Fix a potential buffer overflow in
 kdb_local()
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

When appending "[defcmd]" to 'kdb_prompt_str', the size of the string
already in the buffer should be taken into account.

An option could be to switch from strncat() to strlcat() which does the
correct test to avoid such an overflow.

However, this actually looks as dead code, because 'defcmd_in_progress'
can't be true here.
See a more detailed explanation at [1].

[1]: https://lore.kernel.org/all/CAD=FV=WSh7wKN7Yp-3wWiDgX4E3isQ8uh0LCzTmd1v9Cg9j+nQ@mail.gmail.com/

Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Changes in v2:
   - Delete the strncat() call   [Doug Anderson]

v1: https://lore.kernel.org/all/0b1790ca91b71e3362a6a4c2863bc5787b4d60c9.1698501284.git.christophe.jaillet@wanadoo.fr/
---
 kernel/debug/kdb/kdb_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 6b213c8252d6..d05066cb40b2 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1348,8 +1348,6 @@ static int kdb_local(kdb_reason_t reason, int error, struct pt_regs *regs,
 		/* PROMPT can only be set if we have MEM_READ permission. */
 		snprintf(kdb_prompt_str, CMD_BUFLEN, kdbgetenv("PROMPT"),
 			 raw_smp_processor_id());
-		if (defcmd_in_progress)
-			strncat(kdb_prompt_str, "[defcmd]", CMD_BUFLEN);
 
 		/*
 		 * Fetch command from keyboard
-- 
2.34.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
