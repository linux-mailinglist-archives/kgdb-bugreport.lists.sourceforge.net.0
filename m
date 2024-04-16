Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E410E8A68E3
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 16 Apr 2024 12:45:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rwgJm-0003nU-JG
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 16 Apr 2024 10:45:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rwgJj-0003n6-3w
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Apr 2024 10:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5kQx7z6+Ldz5XYyh8xXwCAcDyA8gIafLtX7+rdECU0g=; b=ITJRYYML0DfdYjnOxnOt7RiOB0
 pJeLThDOQBOWhvW/z/9xbpHc8Z/SnYNHkCr43NN6p5HWCpXFHrFnq1ZVwEOfN7pKxREJ/zF9DgaRc
 9WuDiGWZJcDvNMSMTD6E/uUfsgmwQfSj9FJLuQnTJHwO5GqXd420W0yNQ9H38mLSUo1o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5kQx7z6+Ldz5XYyh8xXwCAcDyA8gIafLtX7+rdECU0g=; b=kK0gFtiMJLlD768lPjBVKzJkLD
 k6CJvVGBj7Svsyk8lNXPTEleOSSBMvuK1LPd99Ka569HbHiN7el2tpRkGbyQPi9Km/1xwoVAERUIY
 6O07Lum0Phix/rUo729w8E1DyRHRSGWWHxHOhXoMOdCdImo/9HWyI7HvJq4a4vq0XZ7w=;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rwgJi-0003a0-5w for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Apr 2024 10:45:35 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4182353a15cso17149505e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 16 Apr 2024 03:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713264322; x=1713869122; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5kQx7z6+Ldz5XYyh8xXwCAcDyA8gIafLtX7+rdECU0g=;
 b=bHcPv3h/0y2pwR/5TE4ThO8qmvOB2YQRZYSu9ZVyS4WHahGGNIVy8SeWlVVpcthi8U
 H2hhEEUOyzehybQo6ZcczKWDmDY476EIKJH3v0EV3sqAjgTdRTjc+J0RL1EGlnGtBEzf
 rrf8ITvmweOYjUQROVjMZ9/QBWkhwx5DEIbpI7uBzGZgVnuBmv6Vco+2jaYC35tZGnf+
 3BCLxSSa5+im2kuuGcREoZjiuoBVfu6yn9NdZtVZKrxziRRFcap1hvNDXBsxBANaffky
 dWvLkg0tMOOFxVklzNC06a0Aj8GyfQeC2Rw7tE6b6rCIcdS5cDIRJSyJ42dQRd02taew
 tXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713264322; x=1713869122;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5kQx7z6+Ldz5XYyh8xXwCAcDyA8gIafLtX7+rdECU0g=;
 b=PGLiSHdQFnGAdxLEcX/w3iGNmwQcf2/qYQbokJwVkfI4dpNWVObJoKyA6xmY1nCXNt
 2cuwvoevw/ztSPXF519kPm8E7KqqDCNLDbuHzdCXXjaiXQ0xqvIwFATYZTfBwGqSQONl
 I3Ql5F6mPuhnbE5u5CK3RC9fI2DmsNhPETMThxySzjVWTn72ZIf36xRoebWpSYvIeQwi
 2OsA4Kw5SdU8U2ZXb80oPtJhazRb/WaHBm9s1UPNRfjCtOqWsKd9SFfh/BqcNtwghdsg
 vPJprkgYxIGBBJeNnUlFx0XQlAFq5QW7i/gRUOC2kXBBULGO/XdmDViKiRtdPSDvoViX
 g5tA==
X-Gm-Message-State: AOJu0YyS7DfgY2Vl57ZlL6L8awdwwm2N3hN8KLE2Mwf1OSEJPCBHWE17
 rELpCC5VBVpG5UmfwBIJ+w7JPITs8RopmIindXwQjcsJI8VpfLudYIG7qCwKacg=
X-Google-Smtp-Source: AGHT+IHTtRNyS7RiqQutDLkv4RpX5jb9ZLT6VAbYyVqY0HwbgVW+ohpwd874WyS5frEK6yACKIVDlw==
X-Received: by 2002:a5d:4d03:0:b0:346:c6e6:b7a3 with SMTP id
 z3-20020a5d4d03000000b00346c6e6b7a3mr9009266wrt.27.1713264322473; 
 Tue, 16 Apr 2024 03:45:22 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a5d6709000000b00343956e8852sm14470141wru.42.2024.04.16.03.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 03:45:22 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Tue, 16 Apr 2024 11:43:18 +0100
MIME-Version: 1.0
Message-Id: <20240416-kgdb_read_refactor-v1-1-b18c2d01076d@linaro.org>
References: <20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org>
In-Reply-To: <20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=7fVDMBM5xVV869P8MZlUPmDuxIwrqax34KtYB5UCsHY=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmHlZdkGw9HMU6ZyFyNTx1wTmdr5u+FzJGQKx1C
 oIc1CdCUlqJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZh5WXQAKCRB84yVdOfeI
 oWYFD/kBz8MRqROT8FtLzkp2dOxoxnKkbbpva59PSCF6knfFq/AA68i/AWI6/Mjb+eX8qqX6HQw
 a0KVrKuWSTVhPxOEoo06JMZfqEwzkyVjOGWI/35UGd4EvCaCuK2YG/gATjyCqtRtttGPVXcy07R
 Ay4ig0syDAd4DKcvehsyKXCxfws/iRt+rKm3bmHWQ8jKP7eqXj5i6+3fZoRXQbuWB+FfhygjMHo
 OWmwkrkDkn9QLJXugOxSPStsjjcw2MgI+WgSms2EbvOBzy8Wcub706dkOK0zci4IRYHpMqRu7Qa
 2xeDDHbv8yWc9jDoZMjfqbRgHMLGG4ASdlYReKyLmz/C6pZLrQd3ITBy4lA31anDfsqUgj3SszZ
 aL/XTepchju5K7H/0tSMkaO0zooUkWZhu1N/79JSMvjDNJYFfV/iO+MK2YZKDwO2/m7XMEHwi+S
 kfzHOF2NIC8eMctYV78EkjPHqMbkmplyD+ELvvfJBUPrIhNN8xIMlw0t/KGkpvRkYwV5TOSN4rD
 PIMfXV7x4NKLR6f145VA/pleGtVVc1H3KAOPM1lQywUDFDa7FDhHUVW3uTgvre7kOoAVNWHY8k6
 CLsvNDvUwvjb8/5IsAvpyp7Glo6mD932aohrcaNX41X6ofAC6MTnVU8ylZ5vTh0RIdI2c3CR0Vw
 BfwqwWE6PK+i1SQ==
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.41 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1rwgJi-0003a0-5w
Subject: [Kgdb-bugreport] [PATCH 1/7] kdb: Fix buffer overflow during
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
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
