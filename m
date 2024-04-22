Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E62538AD1FE
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Apr 2024 18:38:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rywg9-0002U4-E1
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 22 Apr 2024 16:38:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rywg7-0002PJ-Ew
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 16:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nk5QmCkWRIrgsvRQxugPUqs3aSht8TynNH4Q3EEiYLA=; b=ACxnF8aNJO/QKRK+XnJOWNJ9Yw
 TGjkasWGRCt7MTq8V0O5IEN0g29SNj9XGPFBVBnvOOLfY/0Cx3fcRu8k14WajfIM4gUsh0r58oqfm
 c0WYhidkky/3ZS2DUjc8S+dWgMZnYI7BIXYLO02xVU6iiAMZUXLpwADJjdGN3JaWc9KU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nk5QmCkWRIrgsvRQxugPUqs3aSht8TynNH4Q3EEiYLA=; b=l2kMnRRnlwjPM+M74bo+CcEOeS
 8pPMElzBCEVZ3Wmo8IwcLmmwaWDqSv3TE+m60m1MPAaQDA/u7j/A/h6QbH18YIYCQYwz+ANJ9sMf2
 63uAT/1R5qxHTJZaPqNBB8L/gpZ9MVxRSCn7pak6LJigFvq9C5hC+8JjlaItE3ru6Jz0=;
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rywg6-00011T-H2 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 16:38:03 +0000
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-41a442c9dcbso9899115e9.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 09:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713803876; x=1714408676; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Nk5QmCkWRIrgsvRQxugPUqs3aSht8TynNH4Q3EEiYLA=;
 b=WdbCCAvWB5KDVwPylVceH32LN/jJC5h75479+YA6X2X8oeZPzv9VA01WGzznw9omu+
 AYfr7QWPGOuW76y54VC8fh9sbErKbWTTKIzMhLF/9oOTAsD4x2UTkHTvGyYMAyOR+hma
 cYN9YXZHov5owPNIub1wWgUCJxm/K8I4Muy33INhzuyWlpy7+7ufEp47aPHXVwfg+bRJ
 Z8lwwxxDiq6n9+dTfWVywNh3FT2Aewryvv6MsPA7k8j3NL5KLeUBPwBqtBgmNlwioPhE
 A0WQggJcrRxwxAJkeyede2BTddl9OuGVP8va16FCLm/hxvIX3JIQFjfqGKqQQMEkQ6lU
 faQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713803876; x=1714408676;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nk5QmCkWRIrgsvRQxugPUqs3aSht8TynNH4Q3EEiYLA=;
 b=ilE3t/CrmpyA3RGtHmh361myaXvmfCGQL7d2lQOw7QX9aKSEyh7kBX5k3hlpbFE6CJ
 1tcaEFhw24KvqY0Bqaro7yjy2ech/FrWanueC3LLtqkEAsEPa1SPPpLhuwlk8EnI8Sy4
 863DAvkFjAn1OGecHbVt0xix1T0JJXRmKTSHz1R3e10BEDviJI2uRDK8t4lYCuiHzcQf
 RwxWhsbDCRfUVso/FcmXvvAfHKEO/GIqaOtvMBpJlUrwHYIYw7wFengljZtHZHU1Txfw
 p1929AYWECY8mMNPtGVlx+/iuUW5xQJnVARGV3zf+5639CZj6GjI0mx+eZkwuScwTAFR
 fALw==
X-Gm-Message-State: AOJu0YyylDagxf9o1sd8SLOYuwun/+qqclM+X8VQZvXGvQfVxE28uvIW
 CU6MlrFgvu8E9OpX/2U50AzzmHt+hdPEMyttD9sHHqGeW+sZt7fc2bm6pkaZq4c=
X-Google-Smtp-Source: AGHT+IGdbZ8ROPEXmCAeRFFCE1IlKVnfn0ElcoTrib1PzzWJrx4X84g23yKrGfh1exX8j/noBOsw+Q==
X-Received: by 2002:a05:600c:4508:b0:418:95a1:1975 with SMTP id
 t8-20020a05600c450800b0041895a11975mr7465378wmo.20.1713803876595; 
 Mon, 22 Apr 2024 09:37:56 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 jp13-20020a05600c558d00b0041a9a6a2bebsm433343wmb.1.2024.04.22.09.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 09:37:55 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 22 Apr 2024 17:35:57 +0100
MIME-Version: 1.0
Message-Id: <20240422-kgdb_read_refactor-v2-4-ed51f7d145fe@linaro.org>
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
In-Reply-To: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=6LfmSdx/1tWhrPN9tMn/IBWgdpfapqTqrf1F8jgiXeI=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmJpIkax3nnA8BhAmdwQ+q1JJXdXciyaK0wRTdp
 ze988FFBCSJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZiaSJAAKCRB84yVdOfeI
 oR5fEAClOzm3rSzOJIWjtF0ie6Zo4S6K2VgsbsQjG1WYduTN0xhNl8G86G3XNOCAmkJ7AKx2ZMW
 812W94SHSmJhU3wdvG9Ntr9TV3MBRsyLsxysGx0ybN3lzrzkL9MqdEKvg4ggwJ0Aiof+k/39wam
 xKydldkAjYsz7a+2DggOpZKP81AX+E0FERXmwOac3VKvpZfpYszCIqcOEV6U+ImwMeGgnM0Cyef
 xA4uNDcbmnqgOhbOoENorBYREX5cJf5uanSD0NSl5gCHTiAlLZf4DVC+cDFvss4XpNoKu1YmulQ
 SPFgFT6TI/ml4YX52jcsiIY//G5prGPg6TC4SIL98ivTCMHN0VaYDWfLoXCb4ScMctSjYs4SNPS
 bOZbKCJcjj4B5W4AjFaHhHWTMn/0cJlBunXUTgnON0xoA64565OeRMtX4bBrBEpTlnT+EE67f9n
 mP7xzNYfRL5I4nYyMDCTePpaXfGai+LTQCeM/fFUIuDxD8PweAvQlYJd0Glp0vygcKbTA7pqDuw
 UvS5kUcZ6p2XZ9ovgZQVApXUT0JtAmKOUBlbQdJN6Zc/GZ0fm9Q02b+2oSAMC7pWPmtnrTxbwBH
 2EMMW5g0z5lfdGROq83V6O0H75DAQi13UlIxjCWO5VoGJyr9XQCf1+oir+bpHE0VoFQ1sNNBEj2
 pI39upZA9fQFO5A==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The code that handles case 14 (down) and case 16 (up) has
 been copy and pasted despite being byte-for-byte identical. Combine them.
 Cc: stable@vger.kernel.org # Not a bug fix but it is needed for later bug
 fixes Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org> ---
 kernel/debug/kdb/kdb_io.c | 10 +--------- 1 file changed [...] 
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
 [209.85.128.47 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1rywg6-00011T-H2
Subject: [Kgdb-bugreport] [PATCH v2 4/7] kdb: Merge identical case
 statements in kdb_read()
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

The code that handles case 14 (down) and case 16 (up) has been copy and
pasted despite being byte-for-byte identical. Combine them.

Cc: stable@vger.kernel.org # Not a bug fix but it is needed for later bug fixes
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 69549fe42e87b..f167894b11b8e 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -298,6 +298,7 @@ static char *kdb_read(char *buffer, size_t bufsize)
 		}
 		break;
 	case 14: /* Down */
+	case 16: /* Up */
 		memset(tmpbuffer, ' ',
 		       strlen(kdb_prompt_str) + (lastchar-buffer));
 		*(tmpbuffer+strlen(kdb_prompt_str) +
@@ -312,15 +313,6 @@ static char *kdb_read(char *buffer, size_t bufsize)
 			++cp;
 		}
 		break;
-	case 16: /* Up */
-		memset(tmpbuffer, ' ',
-		       strlen(kdb_prompt_str) + (lastchar-buffer));
-		*(tmpbuffer+strlen(kdb_prompt_str) +
-		  (lastchar-buffer)) = '\0';
-		kdb_printf("\r%s\r", tmpbuffer);
-		*lastchar = (char)key;
-		*(lastchar+1) = '\0';
-		return lastchar;
 	case 9: /* Tab */
 		if (tab < 2)
 			++tab;

-- 
2.43.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
