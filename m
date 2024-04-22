Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 035A78AD1FC
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Apr 2024 18:38:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rywg7-0000OL-Ly
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 22 Apr 2024 16:38:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rywg5-0000OE-ON
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 16:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qw8fuXLn1BipxTXGJjzIm9TXoIt9ndz+hzAX+iGey14=; b=aSDagBpq3LCCCu94VnxXusdOEY
 CrRyODLQ9YTVZsNOR5Ysh6ZudQTf29vxt8zdwuXR5NTuKRtG9BkorDwpzaN4lbSC5BihItRJ73yJK
 kLv27/xrk/KCa7nV7JeUuWDV11CTjt8oeUNqt1CTKa+LWsTitRYV1ks+4AkN2Y9x5JKM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qw8fuXLn1BipxTXGJjzIm9TXoIt9ndz+hzAX+iGey14=; b=kyWf2GVhWBbdgw8ipMrZ1bKVFV
 eX5fCUf0XxK0oP6sOvl2C2SniN9FfmMe5Xgt4KRNyqD7nBcrd2ZlYdiRzmwwjwAmYzu0XZ9If9cIR
 XRnz425X7vQfgF8Ff2TvhjYIF7zgbcrC03LFLF2CkMNIMzt9vFK2sYAPleN1GNxejOOc=;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rywg4-00011N-L8 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 16:38:01 +0000
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-34a4772d5easo3684350f8f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 09:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713803875; x=1714408675; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Qw8fuXLn1BipxTXGJjzIm9TXoIt9ndz+hzAX+iGey14=;
 b=XDqmPlZCFmaF0KE915EVTRSn5S8bf3Np79zO6cRBgnTsXHaXQfZ6STmQaiDbYSAAlD
 SZyXCvGuT/WvaOxBJL0EsiKFG9ytrtIVS/C2/W/yijBbPqLa8vdn3M56KXc+DnZGmVY4
 n6SZTyqU9Rn5aT6GLSxLwT414XK+6f+GgpBCRV6/r4zcyfB8UVjRxlqCRtB4gIoNG+2l
 lb9CEfUeuQrphMI9JMhyLVYQBEnvBbgQMal5dhXHHuJe9xjvIEkRudZC9FHgO5Ikkh5w
 CENOxJKiwmeVbVLJhN35ArlfuQrp5T/F+FzeRT5jpFz2wm2lK6M6MBFIWPLjWDrj7Z5I
 vFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713803875; x=1714408675;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qw8fuXLn1BipxTXGJjzIm9TXoIt9ndz+hzAX+iGey14=;
 b=RGV8CUHYhUg9EhbXNaA7F9+1u2xdbO8sAtOrdxkVSulpWMfJde9pFLyLpINJuU356W
 s65ha8x4gmXPkwklxLmgfeUINhZNkczBwz8OocMqL55hpws1Y2S9/OOeXD5nK75WPiPu
 /WayqY4K8XbqBfz+o2JW5M9mazYuTYiQA4wZ5TyNyn99UAu218T+Qs3sQB8VHyuRZ3Jg
 snGt7il2j1pQ2GK0fRRI4c6U/jcyPyuN5TYXZ389sOokB5K6KLdffznfGTm8k/12hTRw
 9P9wxwXVDIwqxwByuC/dCvjpZgnOOHJFPU+CQ8R1l01DdL6Q5slKOGZ/kmi7PXDHwpQt
 I/HQ==
X-Gm-Message-State: AOJu0Yw04zs0YMJR5l8r0tC8xyPjXv/a+pBip3+zR5PgHt6kvpulAABR
 kiQk7eZGEfA1Y2/C1UZ4+wNFoijOeHNQTcvkENZWHvHWWo/E2bcpcpvERSmG7QY=
X-Google-Smtp-Source: AGHT+IGryKOg26pY9YVtF/etPlBEZSaLETo3yB57+/SrqCekYX9SP+Epj5P1Hph73oDDUhm2wLh4Hw==
X-Received: by 2002:a5d:64a6:0:b0:34a:65c8:7413 with SMTP id
 m6-20020a5d64a6000000b0034a65c87413mr8526451wrp.30.1713803874749; 
 Mon, 22 Apr 2024 09:37:54 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 jp13-20020a05600c558d00b0041a9a6a2bebsm433343wmb.1.2024.04.22.09.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 09:37:52 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 22 Apr 2024 17:35:56 +0100
MIME-Version: 1.0
Message-Id: <20240422-kgdb_read_refactor-v2-3-ed51f7d145fe@linaro.org>
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
In-Reply-To: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=jn1ryZV2lseU9K0OYgA4GJIVFoBB6E4nLhtvlmWlSd4=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmJpIWu4GpGHzCm/ReOjDS8WmJ0VBKNsUqlRj8p
 PvT0hB7oC+JAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZiaSFgAKCRB84yVdOfeI
 ofrMD/9Dd6x3qx/aTRlgNTpZTqArAi2poVMKGjmG1834eWva0RZweTx6WYLiH/wrJLRc/6MTaQQ
 GhwXARUTJTzkBwkwnmgaBn5FdQfVm+yqqyykDjkmt8GKErzPLMmO3mor1EOyvjHvuZoxNxFa9A0
 H2o30hkW0G2ceopv+UIbjciCydcesR0BvQ77g4kDKQw5rt3M3uX3VWWziTfHT5HKjKRQgBjxEfF
 VqPpU9WJOCxGSI+43KB1lIG9Jmx2dibWlwMAFHRsOHuHuiSaF0Mu1tiPZrbloa0Wg6qR2BP5BpC
 EWpTcjJCMMS1onNpc6ocPHKxu74mw9I5R5+PfgXCBcr4VThKk0RBc2yBLedKOTMo1umwnytbmso
 cU00codNlahOf7pqzLNVuVvgWzYV1Efexu3sMSUenMxAgulb79Zg54aiPphOCRy8jmKSAYdy7uH
 YahNZ1BgELG2BuoX+UcGME7b3LJ76/9Tysb9vndVo/tQy9Aly48cpIUC8zMIbikLDKxx/cuuVoJ
 KKosrrN82soM72sdCEW7cq5zgWnjGICCzTSk20y8dl+hXyoMPPip7CoKGDOnqkUHpu6zh2HswFR
 Wt1DG4BqESNKBG8dD8do6KHmjwdfFFTUfcmrQBTTwhzNgnVAqoU/RsygQuHcfCpsX2lr+0xZWxs
 SgCt+E5vAk70OSA==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently, if the cursor position is not at the end of the
 command buffer and the user uses the Tab-complete functions, then the console
 does not leave the cursor in the correct position. For example consider the
 following buffer with the cursor positioned at the ^: 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.46 listed in wl.mailspike.net]
X-Headers-End: 1rywg4-00011N-L8
Subject: [Kgdb-bugreport] [PATCH v2 3/7] kdb: Fix console handling when
 editing and tab-completing commands
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
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently, if the cursor position is not at the end of the command buffer
and the user uses the Tab-complete functions, then the console does not
leave the cursor in the correct position.

For example consider the following buffer with the cursor positioned
at the ^:

md kdb_pro 10
          ^

Pressing tab should result in:

md kdb_prompt_str 10
                 ^

However this does not happen. Instead the cursor is placed at the end
(after then 10) and further cursor movement redraws incorrectly. The
same problem exists when we double-Tab but in a different part of the
code.

Fix this by sending a carriage return and then redisplaying the text to
the left of the cursor.

Cc: stable@vger.kernel.org
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index a42607e4d1aba..69549fe42e87b 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -364,6 +364,8 @@ static char *kdb_read(char *buffer, size_t bufsize)
 			kdb_printf("\n");
 			kdb_printf(kdb_prompt_str);
 			kdb_printf("%s", buffer);
+			if (cp != lastchar)
+				kdb_position_cursor(kdb_prompt_str, buffer, cp);
 		} else if (tab != 2 && count > 0) {
 			/* How many new characters do we want from tmpbuffer? */
 			len_tmp = strlen(p_tmp) - len;
@@ -377,6 +379,9 @@ static char *kdb_read(char *buffer, size_t bufsize)
 				kdb_printf("%s", cp);
 				cp += len_tmp;
 				lastchar += len_tmp;
+				if (cp != lastchar)
+					kdb_position_cursor(kdb_prompt_str,
+							    buffer, cp);
 			}
 		}
 		kdb_nextline = 1; /* reset output line number */

-- 
2.43.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
