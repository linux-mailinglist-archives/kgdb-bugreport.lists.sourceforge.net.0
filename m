Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AA68AD202
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Apr 2024 18:38:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rywgG-0006U6-Or
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 22 Apr 2024 16:38:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rywgA-0006Tu-Df
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 16:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qZGZDEe7fnoZT93Svr7Nmn3u9YXAd7uDjSZyL4bPcxE=; b=iAdTknQcX8VMrzbPQGR/pmlk8v
 uT94dsKo4uUnqKJAw9MKIxyhj9s6u2qwT1hpcag2cbZaKCZAOWF7oh/HmWgQaOYz2ypaitrjr0BIo
 MZZCblmxQxlIFWV3FQE9owzg/GBn0hWDzY+RE95zNxPSB0MSOY2BIW9aHp4V1h5zxbXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qZGZDEe7fnoZT93Svr7Nmn3u9YXAd7uDjSZyL4bPcxE=; b=i0BJubG2H35oi9JkkHJ/xMRoC8
 wrF5UE2LXgAddEzOBsOmZq8uGxjg832bmd1/EveVPspLaKodL7RLByvH3h9sFqspKJmAPlr5OP8lV
 fYNcspUrfnpZ5nMChxAwFSnRiiIIUN+9XW9jiJrmv7d0I2Z0DB4eet1OtvCoP1UYvyKs=;
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rywg9-00011k-HG for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 16:38:06 +0000
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-41a77836f16so6924175e9.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 09:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713803879; x=1714408679; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qZGZDEe7fnoZT93Svr7Nmn3u9YXAd7uDjSZyL4bPcxE=;
 b=T6rfH9PzmEPKCZwV6//Kn9isaO3aXCwCGqCTncx4tVyMgcZyNczSjRzgrLcnmngAW9
 xYvh95bzziUpMGL2cyn3yTyp1d62ZdrDjZiwfzA+Bbxi5y3tonpTiknV2JKBlMDzfCLb
 jBGWcioDXtc91ayCRdYVowjzbIM4sxu9cVd12w8MYjU4iPdaUWMEo1Ru76U5o/g4TRHX
 9lH/MkcXF1e2t9lc1Fe7/aQ3NmzP0Hr8Xei8yL8rsUfjSd6eJsiELYCP1MdIPrwkg8ji
 Z4A2oW/cKvltLErPYq0zJGVl8HC1F7yDADyWajmjPnBi8vtdmBFDEtGSyxANnYYkqsCC
 uh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713803879; x=1714408679;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qZGZDEe7fnoZT93Svr7Nmn3u9YXAd7uDjSZyL4bPcxE=;
 b=AIOLzT5wsZogP2LG4FbmckpnUkBuecLyVNye7nraL9tYTGOf6kEYGiaVzq1N4jfWdP
 Tv/dG7OsxCklV1/hP2NS9sbMrQaKL9i/FRlwc6fLH5dupVb0K4Kh2a8IrhXUDAzREp2M
 2ETqRyi+tWFSkLveOX4g1m4WvtyC5ga2RmjciYWX6IGPxoaOl75Jet8osgoQyAjI/hw3
 0NUYYjw4JFYoW8Z9pR2cYXRJkpiG+rCR+H9rL5nJc6xcLlMHnYRBkrv6HwUKunKwRJmy
 bWwMmntbr902Kuw3gUw8q09e9lf33JWg4FszLXL4PTcDnCdLpOxXiFT2IRckIPOgbMiX
 KqDQ==
X-Gm-Message-State: AOJu0YyZTTQK4yqC0TSGJOsAbNJXUwVJ/tdkImUpLIdAakAV7dJzyeBO
 lcg2kkK71Bv+kpmqPSiz1aI2bqtL1B4qmnBiKoz/DvaGifo8tC/iFjiq2+17Ft0dO8b1xt7eOqh
 2yVM=
X-Google-Smtp-Source: AGHT+IEXFlj5GoEouTne/NUIpKd2uLL5aHsKuorpOmx9f/agwxML5PNLpBAAwQO4eBdFAX6Ve1ICPA==
X-Received: by 2002:a05:600c:5494:b0:419:f3fa:2434 with SMTP id
 iv20-20020a05600c549400b00419f3fa2434mr6943703wmb.41.1713803879635; 
 Mon, 22 Apr 2024 09:37:59 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 jp13-20020a05600c558d00b0041a9a6a2bebsm433343wmb.1.2024.04.22.09.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 09:37:59 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 22 Apr 2024 17:35:59 +0100
MIME-Version: 1.0
Message-Id: <20240422-kgdb_read_refactor-v2-6-ed51f7d145fe@linaro.org>
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
In-Reply-To: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=9ajOnuk8c/3dgVcp4I+/1t4zbyy/pCAdQ2SjxrxY5/0=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmJpJAFzVzaduRhdf4iIyVREZ7MeHvob4Xtd3BR
 7GLT8ka0sCJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZiaSQAAKCRB84yVdOfeI
 oV/xEACkDdfOdizY/ztkA6mJARyXym2GSv1nS5yuuEP/cL81L4tENqnRSKTI+rb1LKJssvmXr8P
 OYC9wXUPSnT0RCCROUvEvpHHHbGueO3I3x4HN09nah+m2TVhpFn6Hykd9Hg/OJs7EXGNAW9kGm5
 zCprCSbbvDnD0Mv+OmPZBwhpmNAo134OF0YNFtme8+ehwe4YriCnmXzgojF6RRZkF50N2PeRlPT
 ErkzwY60/w3Z+u36HFkzYmh/tnD77nu9mX1V6KaWFRzUF+XVlvKHGknU+dAzAK0LD+CrRW5iTq5
 pbxzbdbG7nYYPNuv+GkcrS4d+nZQLPU4OMChSYWUUpp61W1I0h2iuVi6e2dTYydydwjQ5E07Pgk
 INdMo/EJuTWd/+JTrvA5q0O8UI1lg1uJ1FagxC4flnss9VW6dkTnR+yeqWzQg1Y3eXE7ZmtOP8o
 uEIu7heYRsvliWkRVL5uXMlxJPF0MXDYKkSiNrvLzwoJlb3a/scjQdJdj67VrAM+Mo6Qfgbrd4P
 6/PRuwJ1+i6vRNThJz2xVYpLJq7K+/aWCr9XARKzTYK0DKlvdxN6WFVIQsDOMNs0Mc6zEILDgzk
 GSNdTmalIqQwZ79BhC925qohq6GCShPRSpA1svvKE+EmT/lwBKiQZy3ce0qizq+8ZjC3I3QlyCK
 lcSErY+3tmPgE4A==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.48 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1rywg9-00011k-HG
Subject: [Kgdb-bugreport] [PATCH v2 6/7] kdb: Replace double memcpy() with
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org
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
index 2cd17313fe652..94a638a9d52fa 100644
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
@@ -379,9 +375,8 @@ static char *kdb_read(char *buffer, size_t bufsize)
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
