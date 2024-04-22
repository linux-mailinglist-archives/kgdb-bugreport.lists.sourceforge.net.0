Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ACF8AD1FF
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Apr 2024 18:38:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rywgA-0003v8-9n
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 22 Apr 2024 16:38:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rywg7-0003um-SH
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 16:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P0169n4vHsrlup9ubNFunAJmhMk888VjX3f7O4lXGgA=; b=juj9KX3mEpAYGC169FhJeVAomt
 GyGIMdug67BRt7TNQ+rM2UmyTXJvhFg+yMViQ6Y5Hq39qo5p5IUuHOzKMwqpn7sZTmJjAUflJftOU
 qvBjDDRnvucTYNijcBB+rMbxOP4kQ+ADObgFSSwIFWfvdplPdoT6G5jr1MVIcjtJOWlA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P0169n4vHsrlup9ubNFunAJmhMk888VjX3f7O4lXGgA=; b=FPFQh/Y1ACC3Gpxu9aFQP+Kzt3
 8OVgT5t0J+cDcbdldlFLp2bxCia4GXFduAcqneHhySQpMMNAuH1a++N/X7z9Kd+lGEKJo2WycOjj2
 ldGl4yTejjCnHKNJ16FhrBgOKKkTiX0H2Jqzv2QNePzRr72qWkrV0LUOLHAmAB78z2Fg=;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rywg7-00011X-BP for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 16:38:04 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-41a5b68ed4fso9041545e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 09:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713803872; x=1714408672; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=P0169n4vHsrlup9ubNFunAJmhMk888VjX3f7O4lXGgA=;
 b=LkNw6QXjwKYgwZX4y6xUlcN+W6gsdk/eBsIy1SfmJKXJ54OIiOSFp/sKM1nrHmgwcK
 c0K6QAWFguY2yMbu0CxlChfUYCYva25o5Aj2KzPapdPZVjlgqDe3wOnmaPs3JEyMpRE7
 kDfInWWTcCSubSFuO7MBTT+9A1DffMiGlkcsGSqtjnDQGU5FOvGelj9xYA5ycJVkfYN2
 Hi3itfrPlvRdGPc9ISHSYPTwd2IrwMx0KBIA+Urx2F4kO3bTm0VVJLjaP6yAcE3YTCOk
 s2ZmVyLeNFopAy9BRoe0Kz6mGmSHAhsojKBxhgLexR+waXG0h6FbJ6IitwToCX6OIYZ6
 HR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713803872; x=1714408672;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P0169n4vHsrlup9ubNFunAJmhMk888VjX3f7O4lXGgA=;
 b=hWN6tHBxZaaQG9aKUAg02LRZdtrcIrv36oo49v3RXicQP+lB44Oje3kLPsnIBWZCG3
 xjiWR9dAzSwKD5tSLIqdRIcvjagcF2WLGFPO4Ck29U5bmsQbop3wOO6GvpM+yrno+CWW
 jZHlxIY0nq62zQbOrfD9NISxTF/OSaHqGeAAqUOf6QLpvr0+wmyH4g3xGI+3iHQPA68p
 yVlcSmmsi3X9Cf7JRPyRtH5CtOEd0tA86O36elPYR2LaBFgDuFBsnlD1JB3J+AAB1krm
 YkaECHezKHHofBD77HGibRVXiBRktj8M3tpWZTTTErOZgkAin9HuQIPOD36Em7yrRfal
 h/1w==
X-Gm-Message-State: AOJu0YzqZKHbk85NUaIul7jnjygGALtfOzNaTFUsxU4Z7XOCmk6mJ+Gz
 XVCf9znnlwpXProKeLzjYASTj66Zw+R+G4cXzXezTZfo1wqOQ+pA/o1XyAPULENiM0Q+sAwDR6P
 cnjE=
X-Google-Smtp-Source: AGHT+IFDAAvb8ETo8De2eJqNKoycsShByig8HHkfyzUlmRRzC/jqyTN43Wz55FLnwpcwrQEy/c1YjQ==
X-Received: by 2002:a05:600c:3acc:b0:41a:5735:66c8 with SMTP id
 d12-20020a05600c3acc00b0041a573566c8mr2041049wms.24.1713803872432; 
 Mon, 22 Apr 2024 09:37:52 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 jp13-20020a05600c558d00b0041a9a6a2bebsm433343wmb.1.2024.04.22.09.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 09:37:52 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 22 Apr 2024 17:35:55 +0100
MIME-Version: 1.0
Message-Id: <20240422-kgdb_read_refactor-v2-2-ed51f7d145fe@linaro.org>
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
In-Reply-To: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2732;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=/6p73t1vQBs60bTu8b+1GCgEu36ZH+1LONSsLqShnFQ=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmJpIIW3xYkh3ftEnJ/RSyvRs2J+mRuC9iAg4cv
 Zv/heHfsbCJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZiaSCAAKCRB84yVdOfeI
 oVAsD/9HzAXKmRkN+CwWlgwz8ifB4D9EiWAg0lomCVFYfz20jy6G5Je4ThTVfqFZr8tfx+7UAUc
 w2pmHbzGWIgWyuzvh3fSTrnjyIj+q6fEISivf/zsypr6pEAtT9E2y7QHz7bbw7fkTQ3OCagZQAt
 LxMq8PsMxW01ztK1BF6DOuONiy7kWJVxmIwxR9e51yxBVQ76PZAqddoRujmu0anlxNYpOjgQA3w
 dkv5AVRLwZrAgtaxllo7q+LcjEUYb6HFEsKFxX4jKd556efKst0VcMLuPcCMxmOY6VhP96w3OZV
 zzMOgQMNwRO4Qu78qQ+cApilvVBgyVbOI76UiD3j85Y6cWxqGVzzrZbWT5boHH/xLg+cs8t6t/a
 qvDh65H3v2ov3GUHXBx3HvXycJg6NzOPuULhczsUbldC9moHu427hrZRhJqd+VPsiWBpxAsqmnm
 LAWujzUl5Iz3HhrKUtxJMlpPtf2IXXLfOBvZAby0WI+CpKWJEqJGJHrSxoSuVU/+xWT7cbyQX02
 gGYIrQZmOY3UTAUgug3legb+LA/XGyPc9VP1XwOdjU++aAcEyNEts4gkYVr3AQ0YCNMjxAv9khk
 9PwvW0NcLLJMxAZMtzBiDgKBE9K8L6svrhdenDqu+6fPbesQ0bIW8ixmo8U3NVD7HAb9xXxnxPF
 KKNQOUakutckF1w==
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
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.41 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1rywg7-00011X-BP
Subject: [Kgdb-bugreport] [PATCH v2 2/7] kdb: Use format-strings rather than
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
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
