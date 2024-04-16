Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0CD8A68DF
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 16 Apr 2024 12:45:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rwgJg-000354-3G
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 16 Apr 2024 10:45:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rwgJe-00034r-Lh
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Apr 2024 10:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P0169n4vHsrlup9ubNFunAJmhMk888VjX3f7O4lXGgA=; b=bBzwVHCnMLew9X8Z1qTEGjC5rj
 XGpQFVwPqGkvq8zc2DReepsqaGOcYXFC2VKDpZdIcJcoETg6d/ZNcLVw6ciEY9561qnd88yrp8Rzh
 C94MGrnlf4r1DhFzhV/YT9dwYGcw1nQ7/Ahrga43kpJD9iJ7xogI0c6W55iDxu5jziJQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P0169n4vHsrlup9ubNFunAJmhMk888VjX3f7O4lXGgA=; b=TP9rF8zhDV3A0q0Lx3LyK9+71K
 uJ3jhl4OI0qxjGWKfjvgFZolp6YSDtAJEEjVNwSjCd/cOidsy8pH8pVmPT2cQ14vMhQ7PIXINiwpM
 O719MAquGoXrGxWBjw/7nfuwr49Mpje4Ytfu0aqPBQP267ZeLk5PNWvDfFdY4sHe6/R0=;
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rwgJe-0003Zm-PC for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Apr 2024 10:45:31 +0000
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-345b857d7adso3091281f8f.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 16 Apr 2024 03:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713264324; x=1713869124; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=P0169n4vHsrlup9ubNFunAJmhMk888VjX3f7O4lXGgA=;
 b=Nrj07lDIlbR/ArHnGelBLpYcFDvMYIB/snNYHNr0CuHHH4AXctiTru3yfxNAOxEZqD
 5KbBcsEn2b6+sl1ZrKNyySPYoKMzEtBE0Xa5KQX5uvv0WxbOo3FtT1jFenE+Rfxcfgd7
 lIDfJCHzW5I+RxxHbON9tqhXRhfzcdGvs9/+Jv6977UZQ7t8fl/qOQPlL1l5gyKy/byl
 TTLqhEaCZYvRI7H+Ir/jUnB2jTVOJi5QOlWcSVobkQs+3b3AbXxT/7q7G4hzPpPbeKUV
 KB/nYNi1D0htUQJ2/3XhDDEr6AGzM7nbd8+lAd0QNkqtlf5Kj53ZtMSW5Pj77Dw8W/9o
 8cyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713264324; x=1713869124;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P0169n4vHsrlup9ubNFunAJmhMk888VjX3f7O4lXGgA=;
 b=t19fZZ+weAZyVh2amiNDRs7yKTy9vdubCBGmdosWqn1bvYlosyRa6ZrQ7JPQWnz983
 ZUZK+0thF3lfU6txoHTfkupEqtNcGTch34iZWCbR9QqXiNWB2NURFGmTzxR2fW/hq52P
 yKs2CDziDTJRkdXZmW71iRQZCn09qn+VGO2fOvuiAMrHwc84dj/iDfD0CZgyO3NUbo1h
 CFUx+ffdMvi71IQKrdxjLaPnHeD2sDS6aHKpkLv6ONk+9RCaqck0QtRH3+8vMzXOGfTA
 iQnCUjv7R2CvlFfrDjUv6CbWO+hHMM/wkiv9Xy+pHfRzTOnm20YxVXB1oki7v0DNxRJP
 C8Xw==
X-Gm-Message-State: AOJu0Yx9pfKfSHiw770Ts7b+DLU+lsVZkKdlTgUF1f2CslK1zAoJTav9
 UtQx8Zu2SWdWdXCpCOs80Onr7XjWQx3+41gdJNRo1cbKjfNXRPvorhrYaA2FH80=
X-Google-Smtp-Source: AGHT+IGuOwdGbie/pxpSPz94XUUg9zfb//N0KACafx0VLdOJav+40VrZnhnexV6h1XjRB6n5HJzmOQ==
X-Received: by 2002:a5d:558a:0:b0:348:1fde:180d with SMTP id
 i10-20020a5d558a000000b003481fde180dmr1439589wrv.15.1713264324163; 
 Tue, 16 Apr 2024 03:45:24 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a5d6709000000b00343956e8852sm14470141wru.42.2024.04.16.03.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 03:45:22 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Tue, 16 Apr 2024 11:43:19 +0100
MIME-Version: 1.0
Message-Id: <20240416-kgdb_read_refactor-v1-2-b18c2d01076d@linaro.org>
References: <20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org>
In-Reply-To: <20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2732;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=/6p73t1vQBs60bTu8b+1GCgEu36ZH+1LONSsLqShnFQ=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmHlZrYDalepy0FpLWeF0EGeYOYWieNEdAFaX2U
 vqR3b0WOtOJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZh5WawAKCRB84yVdOfeI
 oUdND/0XUCjVwdM1VAk8s8wd/ywUnsHM53bbyB1U303aMdO3jiiQozqSV5yJ8dYsdA1ivsDvraC
 0ZGT4+QG15h+MvIfHSrRcQRd0dqi5rFnYZd2Rs0V0gSqZznS4Geqmg290iJRqqVfN906SZvgPyB
 7fDi3kg0RSgLM4/+GL6xgWn8GWaEiInEqljjhsZYsGQ3FnaTvyusQGdZPIyh5ZlU/zJ5iJOXIZ2
 G0Ckc1zvyy/+VIjuEYRNLSEDQJwqgfR3rI+7O3Veyos/5kQmJxz8ozXtgQ8nUWN0xIjYyFKbISM
 SctlwDlp0nYyqgVQP9ZO9kC1Vg4AOmYRUdmVye4OEIrjj2gE7bB06y5tWCPe1gj/ioMlE7n6KOU
 2mtmVb4KWEjeP4bij98eIoONCzDc3VLpsBC9E29SU+r+hjRdT6A44vSyfG2o5LG5LNn/tEjw/W1
 zdjw20kp5v5bbL/HYehx5ef+GTldZlp7FcZ0ySasBrUYHDxDBCJgae3y+YD/RO67DVEMbE1s664
 7dE5ToQQOyNlitD6E4/la2UA8BNzWLu5O9v7dpFBhYTQtMbLWPgteLNORNUEyKetqSnncI8jPiB
 2cAvuOyyUMSJ7p/gBjHUivzNJPud8/IVX+Pm0eluGhHa29mNrF/ygc2bX6FlRqffn5o9TlgsiKf
 462jIxIKGp5gONQ==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Currently when kdb_read() needs to reposition the cursor it
 uses copy and paste code that works by injecting an '\0' at the cursor
 position
 before delivering a carriage-return and reprinting the line [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.54 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1rwgJe-0003Zm-PC
Subject: [Kgdb-bugreport] [PATCH 2/7] kdb: Use format-strings rather than
 '\0' injection in kdb_read()
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
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently when kdb_read() needs to reposition the cursor it uses copy and
paste code that works by injecting an '\0' at the cursor position before
delivering a carriage-return and reprinting the line (which stops at the
'\0').

Tidy up the code by hoisting the copy and paste code into an appropriately
named function. Additionally let's replace the '\0' injection with a
proper field width parameter so that the string will be abridged during
formatting instead.

Cc: stable@vger.kernel.org # Not a bug fix but it is needed for later bug fixes
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 06dfbccb10336..a42607e4d1aba 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -184,6 +184,13 @@ char kdb_getchar(void)
 	unreachable();
 }
 
+static void kdb_position_cursor(char *prompt, char *buffer, char *cp)
+{
+	kdb_printf("\r%s", kdb_prompt_str);
+	if (cp > buffer)
+		kdb_printf("%.*s", (int)(cp - buffer), buffer);
+}
+
 /*
  * kdb_read
  *
@@ -249,12 +256,8 @@ static char *kdb_read(char *buffer, size_t bufsize)
 			}
 			*(--lastchar) = '\0';
 			--cp;
-			kdb_printf("\b%s \r", cp);
-			tmp = *cp;
-			*cp = '\0';
-			kdb_printf(kdb_prompt_str);
-			kdb_printf("%s", buffer);
-			*cp = tmp;
+			kdb_printf("\b%s ", cp);
+			kdb_position_cursor(kdb_prompt_str, buffer, cp);
 		}
 		break;
 	case 10: /* linefeed */
@@ -272,19 +275,14 @@ static char *kdb_read(char *buffer, size_t bufsize)
 			memcpy(tmpbuffer, cp+1, lastchar - cp - 1);
 			memcpy(cp, tmpbuffer, lastchar - cp - 1);
 			*(--lastchar) = '\0';
-			kdb_printf("%s \r", cp);
-			tmp = *cp;
-			*cp = '\0';
-			kdb_printf(kdb_prompt_str);
-			kdb_printf("%s", buffer);
-			*cp = tmp;
+			kdb_printf("%s ", cp);
+			kdb_position_cursor(kdb_prompt_str, buffer, cp);
 		}
 		break;
 	case 1: /* Home */
 		if (cp > buffer) {
-			kdb_printf("\r");
-			kdb_printf(kdb_prompt_str);
 			cp = buffer;
+			kdb_position_cursor(kdb_prompt_str, buffer, cp);
 		}
 		break;
 	case 5: /* End */
@@ -390,13 +388,9 @@ static char *kdb_read(char *buffer, size_t bufsize)
 				memcpy(cp+1, tmpbuffer, lastchar - cp);
 				*++lastchar = '\0';
 				*cp = key;
-				kdb_printf("%s\r", cp);
+				kdb_printf("%s", cp);
 				++cp;
-				tmp = *cp;
-				*cp = '\0';
-				kdb_printf(kdb_prompt_str);
-				kdb_printf("%s", buffer);
-				*cp = tmp;
+				kdb_position_cursor(kdb_prompt_str, buffer, cp);
 			} else {
 				*++lastchar = '\0';
 				*cp++ = key;

-- 
2.43.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
