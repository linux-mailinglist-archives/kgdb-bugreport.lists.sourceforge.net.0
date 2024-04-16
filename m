Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5D78A68E7
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 16 Apr 2024 12:45:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rwgJs-0004qo-FQ
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 16 Apr 2024 10:45:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rwgJp-0004qd-1g
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Apr 2024 10:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oS0wWNbf8WiBpvrYnZvz7jP/0PigZGSr5b4L4txYIPU=; b=QtMueJ0MQFp66YnKyp/I7IlBsP
 LCnUMI3jvyD7dIrRVramDsEi546M5TH5rcDfDLypQJLwdCD1PT7RgUQNtTHcVuVMklg9DyxfTuNFW
 hNcEW4uZ9Dosv0YJCX/5iPd1UoF6/1SdQpVEFADZ48FXr+tXbDVftZ2fT+z1aE7qL4xk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oS0wWNbf8WiBpvrYnZvz7jP/0PigZGSr5b4L4txYIPU=; b=VVCAxAr3ChwlsINeOiLhGOFV3f
 xNOJ2qlm31G8GOff9HbqB2fei8whCkBas83clTNYET6hdOM5PhbR3tp2ScjHgGOHy0AdQKmBF7Y1Y
 FeWwROGlbe+nRtlMm4eXdOBOcQaa3gWqGPy3dbGDkucobwcCgJ8653EJ75VGjvmwRBwI=;
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rwgJo-0003aZ-Vm for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Apr 2024 10:45:41 +0000
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3476dcd9c46so2315390f8f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 16 Apr 2024 03:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713264329; x=1713869129; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oS0wWNbf8WiBpvrYnZvz7jP/0PigZGSr5b4L4txYIPU=;
 b=GUPN9jQ4hZN6dYKm3JWVv3NDGSrOEpl16NcVPaz++YiIzSlGavpmvcsQNPAbOiQDrc
 7Lt4I1QU4YiIhZBoAdEa3y/JDQwFpNpt98L/Opt9lyVFj5qW5vv4b7WCxi76WHH2+5oJ
 RDmV3s/qBGZbrfs43WyEBsaL+XMvKMUDXjGIIrXF5gUeCFeollYCZkuQ6VzZYctdFzYS
 1eNEiMxpZbR73bsR0Ql1x1EVYR5KaWwNdze8THWWzKaZ39afoCv2vpDTCbJleFasLcNO
 h1Ul5JVgriyDJ5Kz8haVORymmT5Tor5Zn2EBUOkSF48jMYHZexKlPjVURvmf16FjvSaw
 YtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713264329; x=1713869129;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oS0wWNbf8WiBpvrYnZvz7jP/0PigZGSr5b4L4txYIPU=;
 b=l3macIl2KD2Fy6N6BcYSxhuQlBna3IkVVzatnkokKMeRiKKcL4X5R43EsI7TdcF72e
 slorMlBiaPBitvfukRVxdVUGq7UUJ2fEKXEJZtS3qlkJ3V9avvs/HfesGZDvAQzUA67i
 braZPSvAAvpEw5fXaWsUO4GOmwJD/QPNDlqfQfcD7pL2wJxAT6IY2Y+w82wfcjrWWky2
 GnbVcQGB6sKioNUxPf6e+NuK0Xk7T5L64ES7yJIXgsWCSqaNVF+fIUzZL9aWwOrdR7LF
 WacnG/W7GtU5M4osFGbLFAioeMwTfWh6sRxbaVSZd672sf32DCYCYz1RYH237iULtLgg
 jexQ==
X-Gm-Message-State: AOJu0YydL3IGbHjDY9Rm0pBNVRFjgGzGib+GMq6x50vHy8+TajImcU8m
 LJ/LFCjyiAOm2P5zJn24ZF97IW+x9d4d0M+6tL61W4aZYd2kYsKu6GCufog6PV3a1V4OuISbzmO
 ZoMM=
X-Google-Smtp-Source: AGHT+IGqn+jcRQRpVFydNv1MCf62MNjuNj8pVlNatJ76HLkHJFok8Y910GSeuntpkpLe2kK4s4cXpg==
X-Received: by 2002:a5d:698e:0:b0:349:8ba8:e26d with SMTP id
 g14-20020a5d698e000000b003498ba8e26dmr522518wru.13.1713264329427; 
 Tue, 16 Apr 2024 03:45:29 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a5d6709000000b00343956e8852sm14470141wru.42.2024.04.16.03.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 03:45:28 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Tue, 16 Apr 2024 11:43:22 +0100
MIME-Version: 1.0
Message-Id: <20240416-kgdb_read_refactor-v1-5-b18c2d01076d@linaro.org>
References: <20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org>
In-Reply-To: <20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=4idmgQRyyCbZHKD0Mmm9fLBykSjWqWqEhno1YDmNYTY=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmHlaWddLOeypVnkvDnI41vqqFzzDHlgZEm7ZQ+
 k/lch9GSvuJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZh5WlgAKCRB84yVdOfeI
 oddlD/9Qq2vjLJ9Ne/HilYWm9854QfB2Ft2pTDtk+nSeYNOmndUo4mxsrx07ACsaTHELqkpyzru
 mYQ8nF91ATm/JqApBrmKWQS/kyEAQH9GSy6BNyB1ClmWeblW5RiJnLyXvgh0KqlzmV8rRAmxqkS
 NutuxoFzNHELJbNm39+g3UUuUAS6Ozo/HRa4tYJCtiCJJ1Vzy658NPBJFjhZCq++We4V9Ooiqjc
 sAin15aBhnVrJu07qq5iKx71cmzUfb0SCTbqezv4BxmV9izjoDcCS3yhRuI0+Ojk4g982+oLbYL
 O94AMF/nNAZougTU9hdYHNflwpKKKMfbjex5NvdIIoQPC858zpPmt6KMAmlPFRKrPJoS5dwbwLL
 tdWclePn/dsfGz6Db5d06C4I34YIO6m5egQ5CjEARv0OptV8tPLpxvMjL9moE/rXT3nNmI3Wi2Y
 zfDHGkI3eYL6BEJcP0kO5smagn8RjfAmVkFgjgy93JjJL/e6H8CGJfRG4gk0t6FJOiA5IeaKYa8
 y8f9zcfOgtLcgvZNFK3/t+rAtXo+RVx6L/ebJA9gf0p1coBYuqOMGDbejiexeZhQwRuamgM7n3W
 pg9tyTUxInl4AZFw5jDv8jdis1TFbnq0keD5BjWlALndIRTKGdldk2vEo0H1H9TRcuErS77l2b8
 9RyOU3TUD1JxjuA==
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
 Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org> ---
 kernel/debug/kdb/kdb_io.c
 | 10 +--------- 1 file changed, 1 insertion(+), 9 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.221.45 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.45 listed in wl.mailspike.net]
X-Headers-End: 1rwgJo-0003aZ-Vm
Subject: [Kgdb-bugreport] [PATCH 5/7] kdb: Merge identical case statements
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

The code that handles case 14 (down) and case 16 (up) has been copy and
pasted despite being byte-for-byte identical. Combine them.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index df7b5eb52d74f..08a86a329eb64 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -294,6 +294,7 @@ static char *kdb_read(char *buffer, size_t bufsize)
 		}
 		break;
 	case 14: /* Down */
+	case 16: /* Up */
 		memset(tmpbuffer, ' ',
 		       strlen(kdb_prompt_str) + (lastchar-buffer));
 		*(tmpbuffer+strlen(kdb_prompt_str) +
@@ -308,15 +309,6 @@ static char *kdb_read(char *buffer, size_t bufsize)
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
