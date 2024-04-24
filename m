Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DACE68B0BEC
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 Apr 2024 16:06:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rzdGD-0004vk-IK
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 24 Apr 2024 14:06:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rzdGC-0004vS-Hw
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W7xv5Gr4R7/WZHUDWU1nCwM+2Vbz0wc+mfKaI2SQTzI=; b=KwCIbM0/cbbZRou+74zypBeJDg
 6iByBubGKqKMoIQTvg/YmYPDP+H8soNm7EMw/Ihm4vS4ttwEfFsmSLPO3B1Hlhm/0aJYP3+WcREEg
 0D1hAGoXb+mGivsewYLduhF9k0lWft5dNpZVLDonCkT+93SkE5o6F5ZPUPyiwIjGW4hY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W7xv5Gr4R7/WZHUDWU1nCwM+2Vbz0wc+mfKaI2SQTzI=; b=WghonZ9leQAiTlZs2oJXbYlk0l
 ZchwIa3fgGLWFeuJYCKmSRHbPu7Fl+HI1/CrmieKVN8OIIGiRbF5yrlCCQJDOCBv2SLP8BabqrFGv
 5MzNFKdZGKRtU2Id0M2XnzXXfn51t4oSEEihWRuniHNxmYDKvF1zvv3u7vyIBIH8xApU=;
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rzdG8-0001oa-CG for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:06:08 +0000
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-34665dd7610so3666741f8f.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 24 Apr 2024 07:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713967558; x=1714572358; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=W7xv5Gr4R7/WZHUDWU1nCwM+2Vbz0wc+mfKaI2SQTzI=;
 b=MqbdA5DzsJPftPepOvJLQZUpfHAR6XxF/m5fpJAQHCvasNzjHlhp0TKnMXDrdubkfx
 2ulryyi0S8dFyn+68wVUqi3hy0h0bp+Ej4q+4XRI5A/bOSFrdIKxWQt0A7+sD2Wb7ISr
 ExY9XfkometbJljj2yBZEFvf8qn40R+RLroDJSQZGH4PMET8HF4cwR4I/Tx2+QDL8Bjp
 Q1rfj0a29BIQHjLMLkfYymGa3uVEg90SENqO3+vjBag+s9sNavA5sYkdyOHBi6aDiZ0W
 RDO1aTHLyUiJxL1UdYwatOjqdbX7X5/5OeDyiedmSLJfsQjR96PnhOCZLaD8Fmr55fA+
 dn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713967558; x=1714572358;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W7xv5Gr4R7/WZHUDWU1nCwM+2Vbz0wc+mfKaI2SQTzI=;
 b=e/32Sk03l2FeGSdcKQq7cdz0loxNUVtsjEdoN9o56eE1Yd9FMudETwi3Q9jlSnjlkB
 JzzuMK2SYYfrO/DofV6ENOZF4l/qpS2MsVyTlZX+rDNH96Wm9FwxIImhAzxEgHN4oHlN
 3Jh2tpvAxnoWse8dHyZQqz57dl/HT32ePKmIFCZcUweJWCqtDDcSJBW7LAFuhWuPZovN
 bDL8K5tjJkdib2+p2YNlq5bznKD0WIOjQUm41RnkDbNq2PP8brXkjTRO75QpoU8DfDn7
 r0enm4mVuYEqaIkozAAKKuvOHXSwVPkhcBUF25Xolpx8jf2NbsdPv62fJlHkkleO2jWG
 wUQQ==
X-Gm-Message-State: AOJu0YwqX2X/oMaJNgj+zIlsEo+Kt6f3HAik+UB9Q6YWrLPUfZkvIs/e
 VopA1tWAjdRgWwfLNknCZ4VorPtpgeShCvd+iyETQnUh+U1+JIhkTFRUEcRvzKU=
X-Google-Smtp-Source: AGHT+IFq937L1Vi7JpHySQ2WjDRGjy5vgDcZRame4pNbvUA68UU9PQwXRC9KVlFkoL4mT3S8Fd8sgw==
X-Received: by 2002:adf:e50b:0:b0:343:efb7:8748 with SMTP id
 j11-20020adfe50b000000b00343efb78748mr1632812wrm.66.1713967558452; 
 Wed, 24 Apr 2024 07:05:58 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d48c8000000b0034af40b2efdsm9105325wrs.108.2024.04.24.07.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 07:05:57 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 24 Apr 2024 15:03:39 +0100
MIME-Version: 1.0
Message-Id: <20240424-kgdb_read_refactor-v3-6-f236dbe9828d@linaro.org>
References: <20240424-kgdb_read_refactor-v3-0-f236dbe9828d@linaro.org>
In-Reply-To: <20240424-kgdb_read_refactor-v3-0-f236dbe9828d@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2464;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=m1nIw6K/wxbB+0xqkP9QU662J3mgsOoAQo76wtMC2n8=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmKRGhHh0sDmQu0SuR6ilg48GgyUTWyWMpc6f/b
 7cMSMspygCJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZikRoQAKCRB84yVdOfeI
 oWitD/92rzCg+qesbfCyE2mJoqhkiy0mr+6LY0ERzA4UQyQczanvfLm/oDA7/lgsVhNoqcc1mQr
 WJXP0XD7ZcigdkkOCQxM6XtTqotz6YvjxpLxcVVFgx1A4Of79ca6WkZGtC2F8QN5/kGzcpZqwjx
 hrBGYW8zG/5UGFz+91CQ+acTceX/bmbDpJq4FDVRSIdX0BAFzWFmliRA1ayfmOl95kWrd9COgSY
 TakLYAogsd5nOMUL3d2mFcQWK7ZqHl1+tv9NA67ZobfJ2QIjmOfOe+vTBNXE8UiGlTnR/XqhQQI
 B51sjhxd/MzAYlBPuM1odRN6eYmtH4WWLTmn0EKf/M+cpTXSOpTtqRt9JkpWkT/hd0KpPkJvchq
 ASsZMIo97PJY28gmN91fE0JDT/VtxwqHGp4tM84+DUZK9w3IlJOEDW28c1OuIx9s6BCMYrCSVPM
 ERusAc8+EtWW9vw95wYHRZOtjgeDklxQb+Zk+G8/Do8JYRr+82vnEl8x0VSkeqgX35azMroX3Gx
 YrCjphlt3LxHzcUZbKnEbHVNzmaQs8dcsYkGHthMCpSvql1pgbRW9zCWP0ONSMQ4L2ojQL/pzbR
 WKbdl+oPfBbYEyOBEMOX3bBEgcD/1il/y1JcUsZ5tqGR8dMhotfw4yBdsd/0qKvb+SbeCEPGcQW
 r3MFtMTucJ/0+oQ==
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
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.221.44 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1rzdG8-0001oa-CG
Subject: [Kgdb-bugreport] [PATCH v3 6/7] kdb: Replace double memcpy() with
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
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 Justin Stitt <justinstitt@google.com>
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Justin Stitt <justinstitt@google.com>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 2aeaf9765b248..40617f36a6db4 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -269,12 +269,9 @@ static char *kdb_read(char *buffer, size_t bufsize)
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
@@ -291,9 +288,8 @@ static char *kdb_read(char *buffer, size_t bufsize)
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
@@ -398,9 +394,8 @@ static char *kdb_read(char *buffer, size_t bufsize)
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
