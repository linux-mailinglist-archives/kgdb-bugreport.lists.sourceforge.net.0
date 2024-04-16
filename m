Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFC98A68E9
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 16 Apr 2024 12:45:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rwgJu-0000m2-QI
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 16 Apr 2024 10:45:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rwgJs-0000lo-CB
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Apr 2024 10:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qax0/HGbPdCX4M7gDaYwDwDlZ1cE1xlWdr0Di9/Hmb0=; b=M/ajSEn5G10vwLu+zWOq9wjWQy
 NGIcBf2SSOzPDZaVtJmIJwgWHXJ4XmTt7NoXYos0/hc3rKsXoaIWvmW4xM0G7jxNPe7L7o11YsAi7
 R7rqgzJVWSPuWTOa6XlpLaypxUV/VvzPQaMAZfRjFosWYC6mCxA5rd9zFYAx8MR9dQ/E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qax0/HGbPdCX4M7gDaYwDwDlZ1cE1xlWdr0Di9/Hmb0=; b=bfjTdsnaShXy1cBVLR+jDyU1W7
 8P4jxlinvG1InIGlSZXuiRaFHaaMLX1pgn4piEtWRNfU7JbEYv3iJJMQgoFR9GSBVm0nTrXMkqh7i
 IRPKo+/ZNX2kYWvWhfDfcXM62EktwPvHUaLyk/x6A+2Kgqs13LTFcJeIG9hlpKQmJCaQ=;
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rwgJs-0003ap-5N for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Apr 2024 10:45:44 +0000
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3497f4336d7so205967f8f.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 16 Apr 2024 03:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713264332; x=1713869132; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qax0/HGbPdCX4M7gDaYwDwDlZ1cE1xlWdr0Di9/Hmb0=;
 b=J8b0TiCpRygbh1wliWiRXi6S4UCRzP/DPaVNTPvVTTNncuM2KzGgMsM//oVamMdcYn
 eXNjp/F/1h6BVY+55MiUClx40cycWCJPIYGyYN3v8wa/JAcYXqNyMiX/thMq+d0ixEws
 oUacjUt95qOH5g+KF5S5cDb/wvcGNWjYk75NJvLWMHTQS2szdD5aTf2lTBnuQiONsqBQ
 KIbdFXgmFbNq4XywWHZk2A7UIjcNJFkd8Yv17VLCCqYVDSs0KRvlCh6brEb1tAw8Sqij
 3Mu/+G6bd4rGLw9hVIaChZsapO1h5TqLPrOZw+HqOQSCncXuf5rRQ9AFc2MoGfahCa3u
 JfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713264332; x=1713869132;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qax0/HGbPdCX4M7gDaYwDwDlZ1cE1xlWdr0Di9/Hmb0=;
 b=A2aHSDzwnM8WMDTI80biK9UZzAZs+kBCdRoMh/hhqynUZ/DhGdSRS6WQvC09ddpyel
 SQriIolv93NjXBiQgMtAWSmmDFjp56vHuNvGqtL048tQwO/Iy2rGXSfViHXFw8gtyJR1
 HkvHweIdtopEJeA3TThlxN2USpiF8HJgc/3V5Kx09qq5YROeHl5NePJ5Lq2gElidm6s0
 unRNNaTezOemA7xdS88WeGC+VyDq9BaQAdjPCWGPzYS315wGbPUR1sBEGyyeyQ2ngCvi
 pzEM7aAvRTwWjroWgZdEEMUvBIX4fGtSAIemNq1tRBSqGZIOIxKkUvXtHlGqniEd1j8y
 xayQ==
X-Gm-Message-State: AOJu0YyYkMuj4ADvNsNYZs7eDlJrJ9NJlFFxGeLwWOn4CPU/kjwTFKoQ
 ZqvxcR4EL+wInDaH7l/6KNaIffPFSs8SBWCKSi1FxRgOj52xjT52BObvWSDVXI0=
X-Google-Smtp-Source: AGHT+IE6Vo/tbKSEfCm2gz79le7FExVDtRtCuxkP1pWrZlx5DmQCQVvhm0MvVCYaPpwW+OmM5iOP3w==
X-Received: by 2002:a5d:6791:0:b0:346:aac5:add8 with SMTP id
 v17-20020a5d6791000000b00346aac5add8mr2282957wru.6.1713264332537; 
 Tue, 16 Apr 2024 03:45:32 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a5d6709000000b00343956e8852sm14470141wru.42.2024.04.16.03.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 03:45:31 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Tue, 16 Apr 2024 11:43:24 +0100
MIME-Version: 1.0
Message-Id: <20240416-kgdb_read_refactor-v1-7-b18c2d01076d@linaro.org>
References: <20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org>
In-Reply-To: <20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3364;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=d2qYpbUEJ3bo57WTysC1k9+78U0fLX5bGNTDzJBq7DU=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmHlay6q04sxazUzKyygazLoHSnpWmcuHg4udwO
 xXfJvb8gt2JAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZh5WsgAKCRB84yVdOfeI
 oSyTD/9r+1V/UTe9ST/Zl2Db/l6Ln98PrTz7OiluHWNsXyfaYlgHmjNI7O64hSS+7rFMZDn5dnZ
 TRwrfbtR3nFvp/Xnb+o0oVUe+K83Zh1hSKkOjVFgX8KoRJ0e2kLRogrHokcCsKByowRwWNXqmEc
 Ac6RHvWWJPimqlww+6L1WrQdauaOoHY9siRHtwma7dkoPkquERl05mbtp+DKjJ7TXoqqyqShwxm
 2HeOIV2U3ZSME9btaKm0UGLVTIG7qbsEVtGShbcTKMaxjzkIK87hMwvAIqyaztOIAaWPCCiL5qo
 nn4EVAkxRRVz8dQwZsZ5HEiVdhFDquBDjw2D3EdspgOsn7VepOLbLbP9i0ROkmJjyLm4k6QEBBH
 K8XIHU6HL4zCUDMGqwHQIDv5AJzaV7SvM6nBLClF6TxdMSfxax/gLvw+nI5AS+yGYBvlWo3yNSd
 aYAceh7ZdtZ9tBbsiuZ6p89XTgFIlgP5Iv2ok5Ga4biX6xlg+urxEykyft456ro5TJKiKDfJhgo
 W0oG0jNON8RIkjPW66QNgbv2xCwt6VOSVmmEQDRMn5hZcmPkyGRvZQPyHksgGESr5Gvp44eFDee
 T2l92jNwr56mCfxQ9+OBTn2pEWTS70hD8zQoMTfkd2BzjwuMVLBHMRugNLCM6KQD+eb6McwgwtG
 D0SmOWQvPxMM4ng==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The current approach to filling tmpbuffer with completion
 candidates is confusing, with the buffer management being especially hard
 to reason about. That's because it doesn't copy the completion canid [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1rwgJs-0003ap-5N
Subject: [Kgdb-bugreport] [PATCH 7/7] kdb: Simplify management of tmpbuffer
 in kdb_read()
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The current approach to filling tmpbuffer with completion candidates is
confusing, with the buffer management being especially hard to reason
about. That's because it doesn't copy the completion canidate into
tmpbuffer, instead of copies a whole bunch of other nonsense and then
runs the completion stearch from the middle of tmpbuffer!

Change this to copy nothing but the completion candidate into tmpbuffer.

Pretty much everything else in this patch is renaming to reflect the
above change:

    s/p_tmp/tmpbuffer/
    s/buf_size/sizeof(tmpbuffer)/

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 94a638a9d52fa..640208675c9a8 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -227,8 +227,7 @@ static char *kdb_read(char *buffer, size_t bufsize)
 	int count;
 	int i;
 	int diag, dtab_count;
-	int key, buf_size, ret;
-
+	int key, ret;
 
 	diag = kdbgetintenv("DTABCOUNT", &dtab_count);
 	if (diag)
@@ -310,21 +309,16 @@ static char *kdb_read(char *buffer, size_t bufsize)
 	case 9: /* Tab */
 		if (tab < 2)
 			++tab;
-		p_tmp = buffer;
-		while (*p_tmp == ' ')
-			p_tmp++;
-		if (p_tmp > cp)
-			break;
-		memcpy(tmpbuffer, p_tmp, cp-p_tmp);
-		*(tmpbuffer + (cp-p_tmp)) = '\0';
-		p_tmp = strrchr(tmpbuffer, ' ');
-		if (p_tmp)
-			++p_tmp;
-		else
-			p_tmp = tmpbuffer;
-		len = strlen(p_tmp);
-		buf_size = sizeof(tmpbuffer) - (p_tmp - tmpbuffer);
-		count = kallsyms_symbol_complete(p_tmp, buf_size);
+
+		tmp = *cp;
+		*cp = '\0';
+		p_tmp = strrchr(buffer, ' ');
+		p_tmp = (p_tmp ? p_tmp + 1 : buffer);
+		strscpy(tmpbuffer, p_tmp, sizeof(tmpbuffer));
+		*cp = tmp;
+
+		len = strlen(tmpbuffer);
+		count = kallsyms_symbol_complete(tmpbuffer, sizeof(tmpbuffer));
 		if (tab == 2 && count > 0) {
 			kdb_printf("\n%d symbols are found.", count);
 			if (count > dtab_count) {
@@ -336,14 +330,14 @@ static char *kdb_read(char *buffer, size_t bufsize)
 			}
 			kdb_printf("\n");
 			for (i = 0; i < count; i++) {
-				ret = kallsyms_symbol_next(p_tmp, i, buf_size);
+				ret = kallsyms_symbol_next(tmpbuffer, i, sizeof(tmpbuffer));
 				if (WARN_ON(!ret))
 					break;
 				if (ret != -E2BIG)
-					kdb_printf("%s ", p_tmp);
+					kdb_printf("%s ", tmpbuffer);
 				else
-					kdb_printf("%s... ", p_tmp);
-				*(p_tmp + len) = '\0';
+					kdb_printf("%s... ", tmpbuffer);
+				tmpbuffer[len] = '\0';
 			}
 			if (i >= dtab_count)
 				kdb_printf("...");
@@ -354,14 +348,14 @@ static char *kdb_read(char *buffer, size_t bufsize)
 				kdb_position_cursor(kdb_prompt_str, buffer, cp);
 		} else if (tab != 2 && count > 0) {
 			/* How many new characters do we want from tmpbuffer? */
-			len_tmp = strlen(p_tmp) - len;
+			len_tmp = strlen(tmpbuffer) - len;
 			if (lastchar + len_tmp >= bufend)
 				len_tmp = bufend - lastchar;
 
 			if (len_tmp) {
 				/* + 1 ensures the '\0' is memmove'd */
 				memmove(cp+len_tmp, cp, (lastchar-cp) + 1);
-				memcpy(cp, p_tmp+len, len_tmp);
+				memcpy(cp, tmpbuffer+len, len_tmp);
 				kdb_printf("%s", cp);
 				cp += len_tmp;
 				lastchar += len_tmp;

-- 
2.43.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
