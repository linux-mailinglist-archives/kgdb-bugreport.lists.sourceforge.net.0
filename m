Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D2A15C887
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 13 Feb 2020 17:42:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1j2HZ9-00075M-P9
	for lists+kgdb-bugreport@lfdr.de; Thu, 13 Feb 2020 16:42:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1j2HZ8-00074q-2l
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 Feb 2020 16:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bhsGWp5ne3QnPpqxRlkmT7D4Kf4En5d9ZglTG1EbOnk=; b=b+A9ra8wle6Hzt/z2Q8pu2n1jQ
 j5+WNdsu+qA08+uZ25AfVaEVIFbdmS+Mv+qVOXwBV2d9Kz8G6Gqy0zx8ci9pQcgbtTdb839vC0pwL
 kBEZtXBiNu29POXtFKRmmy1cjCUmI9Wsk5dLa4L1ah9tp7JY7VwbSmDEFh97x/kRBBK0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bhsGWp5ne3QnPpqxRlkmT7D4Kf4En5d9ZglTG1EbOnk=; b=L
 O8UI1fWvQrgBK5lBx+851egFc2wBEE7Ha+rMH3znB1ovvXhKwGqcvz4hSORd29RRSGFDqtFSaCCS1
 O/rYDVxMi6w+s+0q13U1RZi5MKXF4oG94c1uIFDqVogGv7yMyXeZn7mZDbTlFVNiXoB18ONXRScC7
 5QVEPk0EI9SHqoMY=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j2HZ5-003FFV-3k
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 Feb 2020 16:42:14 +0000
Received: by mail-wr1-f67.google.com with SMTP id y11so7501219wrt.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 13 Feb 2020 08:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bhsGWp5ne3QnPpqxRlkmT7D4Kf4En5d9ZglTG1EbOnk=;
 b=m8NYusRz6pGqHOIbtp/UK78XKjqljtr184HPe9b+etmJlQW5bOC0mqRml3sp3A2Nex
 N9KUVzKA/H6LA57hd/WtL2VYTogSF+e5X26N9Asa0oqItBCe9w+TUW3A2kGEytUCAOD4
 6rFqWl2yOLpJLp1uNWXRV1ynAwxNB/iZFrbk6gFXpgUzJYYaetcphvbT2Xdlvm3AHYo4
 Y8xCiIKAkjS6D9Uh9wSpED1US3WCBkrs4amLxNRKzPpVQnDzUUUMIw67I85IBjoV0yp8
 JLsaF3tMPDbO6nD1dEbIxfITuTMegxy42BdnsKnyTucmzuDRSFW7cuD8Dr4LGBexGAX0
 JLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bhsGWp5ne3QnPpqxRlkmT7D4Kf4En5d9ZglTG1EbOnk=;
 b=A+8OIq6NodgQEZREq4TMCr2qK03/E7/x5wwWAHpeZOnhgdK8iPUjI4tbzpHMCqGRkw
 fPd+2/DM/p0MpLU0bnUIbU7zI2/uXEvpgj5jK45MpxTuWhidT731MrGpj74ISEx1g4Mm
 AEWfSkilJy07atbP2StsG40FCBndEGOqsL3lnyKECkJyKFf5B40zMSL1SqP0Lu7YC6lE
 Y/SKfxQ78im+FMAZbsmXlOgOCk3vN0xGY407TPRoF6LywTibi1t04BzOiKAUSYDi+7dv
 zEo/MYIFLiwnFpmpkiv7iUbWYJ0bXY+mh5qNTAvrNxnRPbKEqldvNzmR5+cY6Ya6JAAG
 10Wg==
X-Gm-Message-State: APjAAAWmiYEQ+OIs4ms/1wzGaxPOiC+uGeKdU/Cc0w/0YK6sTHodZnKS
 Fs+fcsaekSByIHbz0vKLjHjLrA==
X-Google-Smtp-Source: APXvYqyDkeGF7a8mW0wXHklVzjs0VtRvaPbtmdGxhIbIJZmYTZw8vqRf/7h0b/F1wPHDGl17lZYMFw==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr21947668wrq.51.1581612124532; 
 Thu, 13 Feb 2020 08:42:04 -0800 (PST)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id o4sm3461402wrx.25.2020.02.13.08.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 08:42:04 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Thu, 13 Feb 2020 16:41:46 +0000
Message-Id: <20200213164146.366251-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sjtu.edu.cn]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1j2HZ5-003FFV-3k
Subject: [Kgdb-bugreport] [PATCH] kdb: Censor attempts to set PROMPT without
 ENABLE_MEM_READ
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Wang Xiayang <xywang.sjtu@sjtu.edu.cn>, linux-kernel@vger.kernel.org,
 patches@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently the PROMPT variable could be abused to provoke the printf()
machinery to read outside the current stack frame. Normally this
doesn't matter becaues md is already a much better tool for reading
from memory.

However the md command can be disabled by not setting KDB_ENABLE_MEM_READ.
Let's also prevent PROMPT from being modified in these circumstances.

Whilst adding a comment to help future code reviewers we also remove
the #ifdef where PROMPT in consumed. There is no problem passing an
unused (0) to snprintf when !CONFIG_SMP.
argument

Reported-by: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_main.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index ba12e9f4661e..8dae08792641 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -398,6 +398,13 @@ int kdb_set(int argc, const char **argv)
 	if (argc != 2)
 		return KDB_ARGCOUNT;

+	/*
+	 * Censor sensitive variables
+	 */
+	if (strcmp(argv[1], "PROMPT") == 0 &&
+	    !kdb_check_flags(KDB_ENABLE_MEM_READ, kdb_cmd_enabled, false))
+		return KDB_NOPERM;
+
 	/*
 	 * Check for internal variables
 	 */
@@ -1298,12 +1305,9 @@ static int kdb_local(kdb_reason_t reason, int error, struct pt_regs *regs,
 		*(cmd_hist[cmd_head]) = '\0';

 do_full_getstr:
-#if defined(CONFIG_SMP)
+		/* PROMPT can only be set if we have MEM_READ permission. */
 		snprintf(kdb_prompt_str, CMD_BUFLEN, kdbgetenv("PROMPT"),
 			 raw_smp_processor_id());
-#else
-		snprintf(kdb_prompt_str, CMD_BUFLEN, kdbgetenv("PROMPT"));
-#endif
 		if (defcmd_in_progress)
 			strncat(kdb_prompt_str, "[defcmd]", CMD_BUFLEN);


base-commit: bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9
--
2.23.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
