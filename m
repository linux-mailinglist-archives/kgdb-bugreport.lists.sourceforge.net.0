Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A02F8AD203
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Apr 2024 18:38:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rywgH-0000P8-Vv
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 22 Apr 2024 16:38:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rywgD-0000Or-VL
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 16:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qax0/HGbPdCX4M7gDaYwDwDlZ1cE1xlWdr0Di9/Hmb0=; b=iU3r0BkH5nXlFe1UO2hOSLmlTJ
 YkuLMkffvSsyAegMpHb03asmg/b2yHGKiNWtDXSCv/BPtnYylDn/ek3BobQ/oAbjGvOHSoXzJ7EP6
 QR1zxehp8m9C7552XrNqoJubDznLKYX48iybnkYX+At2EcWcNCXIMt758zDXThkxkka4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qax0/HGbPdCX4M7gDaYwDwDlZ1cE1xlWdr0Di9/Hmb0=; b=KxNP1g8sopuQTV8etQtHXfcE++
 RzvUUhTnXjFQIvP+/ZIdG2Ts7xXKu277MaY8jJl7nL/lDRLMpnivKMG/oxTRWEG1Vq537wlIfgTDH
 i15fShguLdY1Aq1RGn+aF+5gS7F4pwNvrP+fwP/+yauyWxIVVOvk0j82aImMHipuvdgA=;
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rywgB-00011p-6v for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 16:38:08 +0000
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-34388753650so2374194f8f.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 09:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713803881; x=1714408681; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qax0/HGbPdCX4M7gDaYwDwDlZ1cE1xlWdr0Di9/Hmb0=;
 b=eU2kqM9umomZJnibzOw4UYDalHwFfA4Woy8Y8oh1F5f2Zwkl2Uh1/sgpPjmj519pdJ
 GAosjfm6jSNcWXsndNCYHU79+8M1H95plhOvLHMPCZxO2hoJv/OYIwmPGnX/XmZ/K6cY
 x3b0WF6F8L7gj4WO6c/2u0dBM5asV4SsLjHvUx68saNrMNHRcPL+vTtjuzd0LHuQrYdJ
 Nf5338B40rjT5M4aqWIJnymaeHhkY7dMgv9khY0y/GZyOVt4tgMJvK+h1uHcZhaVm7C6
 KI2WODoUV3J/QNAn4rmmYmRNacYLtGeER4RmAbSAcH/e6Xx+PhxbwEZD3cdIkxPRbZE7
 b0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713803881; x=1714408681;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qax0/HGbPdCX4M7gDaYwDwDlZ1cE1xlWdr0Di9/Hmb0=;
 b=u/wASDK/Cy1PHGS1Ny4d2JgQoPg7pBlhXdkMkrsRVZb1BXByLkDJerSZLkQ0FA/klL
 AaOWIwhrLX3r2b32rhXVy1A6AZTdhWuejMtBfTgnLK2OtxhLXeq7iGiti9M6aCAfI6wS
 5uWQkbkevwzXvBNwQKhxnVTpf17tTmHtyZ5bllzYtwIMFWEACy2qL5S0DpY8lsIV5w3z
 /8aSMWxHdFZVXNHHL1/m4EnzWsrfa/V+yuLWS1NJdvO+IYiWsfhpySJUqqKcbrfw8WEg
 9/Y0p7U36ugZh76b3jDvvkpOS2ItacuvtOb8cG0URlwMlaD865hWeA/C7DyJ0ks5GSWd
 KwJw==
X-Gm-Message-State: AOJu0Yw0U3EJ188xvyLd+PaBydYKS4uxUyKq9KlsUCi1wAiK0MC2X86X
 cjYuBghKx9EhB3ec0wNlNJnXh8AADHm3POziNLXsiCUr0571Cz4pf/iN4BmgUiA=
X-Google-Smtp-Source: AGHT+IEzy7IMdvyIvZX9JXpBHD3JCWT5CYEangjxakk2Yk/cQGKphKCelIukMXUJsOjUWyYnWCSXyA==
X-Received: by 2002:adf:f312:0:b0:34a:9bd2:e062 with SMTP id
 i18-20020adff312000000b0034a9bd2e062mr5682563wro.22.1713803881330; 
 Mon, 22 Apr 2024 09:38:01 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 jp13-20020a05600c558d00b0041a9a6a2bebsm433343wmb.1.2024.04.22.09.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 09:38:00 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 22 Apr 2024 17:36:00 +0100
MIME-Version: 1.0
Message-Id: <20240422-kgdb_read_refactor-v2-7-ed51f7d145fe@linaro.org>
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
In-Reply-To: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3364;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=d2qYpbUEJ3bo57WTysC1k9+78U0fLX5bGNTDzJBq7DU=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmJpJPqisf3kvs1fsDrTPdS/Hd2TSSUyPhD/I/e
 YRmAXjvr7OJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZiaSTwAKCRB84yVdOfeI
 oVLKD/4h96QoGB+ELO66U9tQqvmQKx7Tivdsqq8aKGjehaXAk2JgbjFI62eJd/dwlFkk6fR3PPp
 uUVId8dKR58fXSpB+yc3dei1qYxbdQf9EnPSvVZr3rzYB7RJeUHdxm629ZwuYZ6eG2IRh9gFwvN
 uxnsHpmiUhHbjCWpmzcNiBGrKcJEES/T7zITubiAMIR7DhBFztzdWt+Rw4DlF7aKobXBLYXrSng
 uIuA/fIP6CJQVWpqDAyKENpm6eIMDLRMWKqJtHFGBa9hARFsGv7xpWntSMvtNZxDJ1rtcnymxWU
 E1MPUBf16UzHJ9728ylZOlKSJgfzpeSVYgZw5WE+pHxEcKo/2+WpSppm7YJCvfObvk886tKI3r7
 1avBky2T2w9MTajvja8P57GdQpx/cQeFGuRV/Qm9YQsLqI6PTXtDySCamBKPy/yucQRVoNtyMnN
 9nHGtEhlWQ+6eUhZT8rUBBTzLIyXIkkAPDABVaQcNBqxNn2C6JVmra7MWPXWnZu8FzZw6La2tOr
 ClFQh9AzXn0IShJ7ypZqYoBX87lasKlU8Xa2FvmyuU478qj+Lq/CV9EOZXmF393FOFEVtfaCJ3p
 wwINiDgepdX9FlUsJPk3IEhCeCEop3FVm2EUFXbFCp9SS7sjZ+rr76/SKZONT0m2hjk9rwtbOv4
 95h571eDSbaFKuw==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 [209.85.221.51 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1rywgB-00011p-6v
Subject: [Kgdb-bugreport] [PATCH v2 7/7] kdb: Simplify management of
 tmpbuffer in kdb_read()
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
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org
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
