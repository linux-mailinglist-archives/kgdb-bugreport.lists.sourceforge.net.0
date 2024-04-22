Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5877C8AD1FA
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Apr 2024 18:38:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rywg3-0006TI-GU
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 22 Apr 2024 16:37:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rywg2-0006TC-Nk
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 16:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uLlQJvdv0mXKQuHEFrLRmmeJdLfjSnZqxQsmnOGp71k=; b=AR9c8ons6mNNi4KonS7+t2yTbS
 6wZDpgpQqu7/Mc2ayML03G2IzdrElH9M6n2tT5c3Av6UUKp/UefMvy1qWaYJHyoBbcnOb3V3o7mgU
 i17OXsjHU4oRF+hW+ZY5sAGcRKuV8TWpIFnK32f1VRUXI4DxsuM6v5CvpT+pUyh3olWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uLlQJvdv0mXKQuHEFrLRmmeJdLfjSnZqxQsmnOGp71k=; b=c5c5bZYcE2nOdo9BdxKIE7EBSM
 7QozHXlBkDIZnCcMLR4HBmgraD+qL+GMSPFnQg5FIUXMAXd+2cWxrkZmERDT/HS8+95O0Q0PT3+ZT
 XaKgqKDU2OR932VgdGxYfKnmC3hJTyL8uWyNnFGq1KI70QW+lISjzlnavuLENOACMkUE=;
Received: from mail-wm1-f49.google.com ([209.85.128.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rywg1-000119-SM for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 16:37:59 +0000
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-41a5b68ed0aso7726175e9.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 09:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713803872; x=1714408672; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uLlQJvdv0mXKQuHEFrLRmmeJdLfjSnZqxQsmnOGp71k=;
 b=wrhaeNtaJY8pJM5R3tpyIWw5VOmaYEA+VU1pBc5cb2UKf8dhv0yRMu8L89nrjpDedO
 d6W5yKJvQKJTx/oNwZYX5HCugSM27eQxgiH9Ah8vvse4t/RiWKiFCKWMfsqv2mpKkemt
 9en1iR2q1ijJ5IptdaV8d7H0vT+tii1tsWVSeFTDYrilWx0dFjT1zkFh7arGAmlpwUH2
 Q1WO924ik2//rftXYeLUn8vaGOjy0qfBdGEqoZLBQdp0OTmdmgJaU4qPZ2hfFwNRKHxO
 QX6xVMZ+2GFRnpe4yklKuZQBNy1gHzxv3jgzpB1Gua9NEVRLOv1tyYwv9F8xbtiaF0nc
 I90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713803872; x=1714408672;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uLlQJvdv0mXKQuHEFrLRmmeJdLfjSnZqxQsmnOGp71k=;
 b=WufwXn1BmkobH9f1efPVGxn67G+sePRjNj87+URV5MYPHoD4LDV9s/szOPI01AQiX/
 wxtMOEUdkPpjhVv56PmtdxiE68gWVVUhuD0qLcYOli3F/P/Xgy/RxcnNc4ZY/gr07/Ue
 BNBBO2umQ4hZ7FN0F8cv0vwO/EFrn0Ha1LFkbtH++VvZIziXpvZOhRmug1SWPhisYlit
 WtRkH4lvHIeGkCMp1WCX518nJlferpfC+kRjXf8X/rY4873o5z5Y2ojfX9ZuIL1ZW+Jd
 1XaDodGKV5xKLOB3tixVzvGoEaALu8TWMZ6KSBnIS5zdc08JBJw7PUkybcFYM8ka46UU
 5DHg==
X-Gm-Message-State: AOJu0YzZ8TI0EUZr4b0uMXLKAO/N/CxRs1eTT0HB/VD9NcasgCiMqCmZ
 eBqm7EeELHn1SXf2z0VyD+9+IubyDrUQS07A6OA9hStdoI7oEk9HXCdxZ94nPEc=
X-Google-Smtp-Source: AGHT+IHHkVv9DQX/lIAuRVXKPDE+plq+CITnqv7QwHnCNH5XAeZdPI7izVuhMSryc6z8ud8SzuL6zw==
X-Received: by 2002:a05:600c:a01:b0:41a:2fd9:fc9f with SMTP id
 z1-20020a05600c0a0100b0041a2fd9fc9fmr3843899wmp.41.1713803871796; 
 Mon, 22 Apr 2024 09:37:51 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 jp13-20020a05600c558d00b0041a9a6a2bebsm433343wmb.1.2024.04.22.09.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 09:37:50 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 22 Apr 2024 17:35:54 +0100
MIME-Version: 1.0
Message-Id: <20240422-kgdb_read_refactor-v2-1-ed51f7d145fe@linaro.org>
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
In-Reply-To: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2106;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=RD1vVQLp64mLJfhlSPCd/oxiYJDCACPe4enawcw/m+0=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmJpH6kqjNS17dkmKBXEHPrV0RK4mr41OpljOyn
 f1xQLXv9tuJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZiaR+gAKCRB84yVdOfeI
 oU4pD/9KY2d7fqfBxeIVIKTM7DBkMfKKzyOvuLFcAAvoyUCVc7nzcmUXMIvxo5Lhr5cWaUVIEf1
 aw65pCUM0sJzZaXSuhIU//iHoootW9Rk51sVMg2GMtcCazJ1mCl3itLI6bDT3hnhG+ifrnfxCV9
 c7LK+Fvii3VzhAJ4B+aStvFDm4PNtKOCA450awbfG95y8AuBL474ZcUbaM+XE7y/JJHFt1OzOsm
 JfNcRL3bMJ7z4/UM4h5NJRcwGfEHucDLHB+zfJdRG27gxNQCZfcsH8jWdmDvAWfeLPGdGS0hBRJ
 lyqYqLi1C/jUVzV83DVD8LmPH+YZgdcZFXiSrzi6v5ur2Lxe8OOgq5Xl8hHiY8oXsKwbXuXigsh
 Zx3KNGS0uxGj65O4Q929ffAVoi4caDLBntCdah0q+rarBuonRLt+NjRZFYmGpf0NO5ely06Hn2t
 P1BiA6ffo9tfrRO8c5iDs/dcmoeWpEDIZ/Sr0q42Lcs6F0vbOSy8+/4Jhx7vrpbv7DPaPZ6wTZ9
 qE3lUqD2tRgS3Y8fjH9bWHvl849maqDqPSbkQHPRQ4eYtoBWGFuNzU0FFN2i/24c25BAmlbnaqZ
 T+r2VWFvbLClrFTHtYVqFeGMl2NvE3y7Apg/BvBVsGcjUr5FXaHRbmIXOTck7X6FJ+APD6hO8G+
 YDpTFf1NnTNpucQ==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently, when the user attempts symbol completion with the
 Tab key, kdb will use strncpy() to insert the completed symbol into the command
 buffer. Unfortunately it passes the size of the source buff [...] 
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
 [209.85.128.49 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1rywg1-000119-SM
Subject: [Kgdb-bugreport] [PATCH v2 1/7] kdb: Fix buffer overflow during
 tab-complete
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
 stable@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently, when the user attempts symbol completion with the Tab key, kdb
will use strncpy() to insert the completed symbol into the command buffer.
Unfortunately it passes the size of the source buffer rather than the
destination to strncpy() with predictably horrible results. Most obviously
if the command buffer is already full but cp, the cursor position, is in
the middle of the buffer, then we will write past the end of the supplied
buffer.

Fix this by replacing the dubious strncpy() calls with memmove()/memcpy()
calls plus explicit boundary checks to make sure we have enough space
before we start moving characters around.

Reported-by: Justin Stitt <justinstitt@google.com>
Closes: https://lore.kernel.org/all/CAFhGd8qESuuifuHsNjFPR-Va3P80bxrw+LqvC8deA8GziUJLpw@mail.gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 9443bc63c5a24..06dfbccb10336 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -367,14 +367,19 @@ static char *kdb_read(char *buffer, size_t bufsize)
 			kdb_printf(kdb_prompt_str);
 			kdb_printf("%s", buffer);
 		} else if (tab != 2 && count > 0) {
-			len_tmp = strlen(p_tmp);
-			strncpy(p_tmp+len_tmp, cp, lastchar-cp+1);
-			len_tmp = strlen(p_tmp);
-			strncpy(cp, p_tmp+len, len_tmp-len + 1);
-			len = len_tmp - len;
-			kdb_printf("%s", cp);
-			cp += len;
-			lastchar += len;
+			/* How many new characters do we want from tmpbuffer? */
+			len_tmp = strlen(p_tmp) - len;
+			if (lastchar + len_tmp >= bufend)
+				len_tmp = bufend - lastchar;
+
+			if (len_tmp) {
+				/* + 1 ensures the '\0' is memmove'd */
+				memmove(cp+len_tmp, cp, (lastchar-cp) + 1);
+				memcpy(cp, p_tmp+len, len_tmp);
+				kdb_printf("%s", cp);
+				cp += len_tmp;
+				lastchar += len_tmp;
+			}
 		}
 		kdb_nextline = 1; /* reset output line number */
 		break;

-- 
2.43.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
