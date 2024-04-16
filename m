Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEAA8A68E5
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 16 Apr 2024 12:45:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rwgJq-00036Q-9r
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 16 Apr 2024 10:45:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rwgJn-000365-Mk
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Apr 2024 10:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x3zSnbElzKQHrnLI0Y5ncXpIrKp1Mj5wQa45HhWSlw8=; b=Y4UOaP3c2ygZbGTd68uxPi81xa
 b27NN0IjTM3nbd49yvKLn/5uUXzgYQLmBuYVSPT1JKmlPylLka06ZICgZTA5Orvjj7FIwd4+axUhk
 fdr9zpbieC12ew4YjGoM370NPPGMlAnqduYaL41jvS1Qs8kbxOW/TKM+PNiHFaakHzlk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x3zSnbElzKQHrnLI0Y5ncXpIrKp1Mj5wQa45HhWSlw8=; b=HUIVIaVzuaS/iXwywN3viTOPhf
 ESZQPBzxCz4UAP15CbZd9c6XQWiPljIA8dIdTJnjrRqpJIZnLBk62IwVSYqlKCdwuDRnE/SKtBxqF
 uQRasuQEHC3bfXNp813cL7sLWmZUUwyll818mdBQZ955mFANRVVgwQ1BX94uOyurYf6E=;
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rwgJn-0003aV-Rh for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Apr 2024 10:45:40 +0000
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3455ff1339dso2899682f8f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 16 Apr 2024 03:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713264328; x=1713869128; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=x3zSnbElzKQHrnLI0Y5ncXpIrKp1Mj5wQa45HhWSlw8=;
 b=GcmZTLFNxDajXiKmO5yROvfZ+aYDZLBWAe2HAvaP3a0EDTa0eUVHD/D2zAV6ikrBKh
 2s5XwEbyv3CXEd8o3gXv6HXuVQ1eivkttrI+FH7CdqekchO3GTe1cstY/jWlB1xWJYuH
 0t6gcJryvAHZn6bf33T4IhkzVdnpSMz1TaU54henLR3krQ0XVOOUCERyZYaRutRQdhMl
 KaJdLcUPfHiqp4XYtawrecvcBjj3W6m0S2Y1JlBif2ys2nhSBT9T89Kza1Is22vhv2vV
 52B3sXYjAP2JW3yX9l6mSWp+n3jCSkl7nzzuREG5SPV8vBfLFoSnmettX6VLOXm5NeW/
 NfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713264328; x=1713869128;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x3zSnbElzKQHrnLI0Y5ncXpIrKp1Mj5wQa45HhWSlw8=;
 b=C7Cnd1Noc9Vtw2nHuWZAJtUOBpEZbV1HwDHVcbn6cYvRhwy5hMCPoZPKhlPvhqYnp4
 y+JPoCYG+tzK1vELUeKSKlQYLCN1XouizLARjdwKN5BllVCgrsQT/43NQi9f+iLF6Igd
 qZmfmZFqQcZuKuB4XdeDVX5Ualh1OR7DUCjAIs68HWpnqLCjmgLGBZLpBHf1YFQpcVTJ
 lYwfHamMCqpPONasQNsaCGH9TFYlLjPYAILsTUW/LL9BuZ15a+D+G5SWbhCDKOOkwDlb
 vtHhf10yjq9mo6dzMgY0DMR50PksZj09/T1a+PKRkXWESnEv0Cl8vameDeU0BzeQGCFe
 oeqA==
X-Gm-Message-State: AOJu0YyCUxoKx1iTj0qh3i5pAf4KNtgJSrR/8R0Hv6DCMgQT/DL3PGUR
 c3bZUT17r0uEViK1+/P2YHXmanmpEIYXwOwFN9ExwLUot9MwSQjtjEB/TZzLM4ukoxTnnBMCGPH
 lSog=
X-Google-Smtp-Source: AGHT+IEz6WRB5qOtlWnobbrrDvCFGZjBjm3K48IZnQKITkZAtG91am1SaEGBYjuYiccpZNzIgVJAGQ==
X-Received: by 2002:adf:fa8b:0:b0:346:c912:3e97 with SMTP id
 h11-20020adffa8b000000b00346c9123e97mr11039481wrr.44.1713264328219; 
 Tue, 16 Apr 2024 03:45:28 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a5d6709000000b00343956e8852sm14470141wru.42.2024.04.16.03.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 03:45:26 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Tue, 16 Apr 2024 11:43:21 +0100
MIME-Version: 1.0
Message-Id: <20240416-kgdb_read_refactor-v1-4-b18c2d01076d@linaro.org>
References: <20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org>
In-Reply-To: <20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=S4M9Ru+1w6mbv19P1LIu/epAWq5YDJmDyvRXYCK9Uq0=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmHlaIgp772UyxnY8agt2JGoM8TVxz0LSXOcPKI
 cGsKObOlh6JAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZh5WiAAKCRB84yVdOfeI
 oXJgD/wJGBNVaYRnmXaLvz4adNakAOABFGn+Hw9X9UCHv1p8XXE+9aFHB23q/dWWRTUhAGVbuZ4
 48eZlLE7wdD2jJwF66IAB9QjH3wzLceNb/uhrYLDa+lYQFpYsYH0TzC23HYvnixnP4Qjo5ICgCd
 k+PnfUlyb//WTxydsON5gVknc+AFcAMIHaa11Mf9bW5LU+UcxXm6VLb+NEys0wARasqCWj+qlyO
 rt4Uvi1lhMrIkdCo9itLfc3p/tiHwaTpnVFFTZ7HYKW6syWQ4iVYya/KjavJ8KdqCa/VdgRCbmY
 QjF9GR8vDmwZroXglAuTp1iF9jgTRsLiuEaYncipHZbsbdp7tlIIkGlBg/x7zBMf4jACGqd7Zva
 8iOnR3DY3KRRpTvhm+k2Srd7d6W3gmMSD1THv7NyJ5FSznvjvXxFJyqQ9juTDEQ/1o2ODw8HzvB
 VGi/56glgFiBYzMacbK73ksF2N38FYT7pNOT6vDZyt5YSlOyQZEAa+ChIVon4t6LNdUjy5QLOeG
 vx4etwiKu7nTnTSrdstKo2b47Y+hL9BEtH3GtSknjgX3V4qCmp40uoWVTEfezO4UxU23WQVW9ug
 84nYz9mn3j90MoquPAl66cQ7tQ9mMFhpFp0DMvEF7NPgE6tq2+HcD8kWTYiTbE0HKrtRkiFfHPs
 fOGr5ZwF06vsO+Q==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  At several points in kdb_read() there are variants of the
 following code pattern (with offsets slightly altered): memcpy(tmpbuffer,
 cp, lastchar - cp); memcpy(cp-1, tmpbuffer, lastchar - cp); *(--lastchar)
 = '\0'; Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1rwgJn-0003aV-Rh
Subject: [Kgdb-bugreport] [PATCH 4/7] kdb: Replace double memcpy() with
 memmove() in kdb_read()
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

At several points in kdb_read() there are variants of the following
code pattern (with offsets slightly altered):

    memcpy(tmpbuffer, cp, lastchar - cp);
    memcpy(cp-1, tmpbuffer, lastchar - cp);
    *(--lastchar) = '\0';

There is no need to use tmpbuffer here, since we can use memmove() instead
so refactor in the obvious way. Additionally the strings that are being
copied are already properly terminated so let's also change the code so
that the library calls also move the terminator.

Changing how the terminators are managed has no functional effect for now
but might allow us to retire lastchar at a later point. lastchar, although
stored as a pointer, is functionally equivalent to caching strlen(buffer).

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 69549fe42e87b..df7b5eb52d74f 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -250,12 +250,9 @@ static char *kdb_read(char *buffer, size_t bufsize)
 	switch (key) {
 	case 8: /* backspace */
 		if (cp > buffer) {
-			if (cp < lastchar) {
-				memcpy(tmpbuffer, cp, lastchar - cp);
-				memcpy(cp-1, tmpbuffer, lastchar - cp);
-			}
-			*(--lastchar) = '\0';
-			--cp;
+			memmove(cp-1, cp, lastchar - cp + 1);
+			lastchar--;
+			cp--;
 			kdb_printf("\b%s ", cp);
 			kdb_position_cursor(kdb_prompt_str, buffer, cp);
 		}
@@ -272,9 +269,8 @@ static char *kdb_read(char *buffer, size_t bufsize)
 		return buffer;
 	case 4: /* Del */
 		if (cp < lastchar) {
-			memcpy(tmpbuffer, cp+1, lastchar - cp - 1);
-			memcpy(cp, tmpbuffer, lastchar - cp - 1);
-			*(--lastchar) = '\0';
+			memmove(cp, cp+1, lastchar - cp);
+			lastchar--;
 			kdb_printf("%s ", cp);
 			kdb_position_cursor(kdb_prompt_str, buffer, cp);
 		}
@@ -389,9 +385,8 @@ static char *kdb_read(char *buffer, size_t bufsize)
 	default:
 		if (key >= 32 && lastchar < bufend) {
 			if (cp < lastchar) {
-				memcpy(tmpbuffer, cp, lastchar - cp);
-				memcpy(cp+1, tmpbuffer, lastchar - cp);
-				*++lastchar = '\0';
+				memmove(cp+1, cp, lastchar - cp + 1);
+				lastchar++;
 				*cp = key;
 				kdb_printf("%s", cp);
 				++cp;

-- 
2.43.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
