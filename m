Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A508A68E6
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 16 Apr 2024 12:45:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rwgJr-0003oY-So
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 16 Apr 2024 10:45:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rwgJq-0003oN-Va
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Apr 2024 10:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QDnp4eLfPkrNB753JlPHc4+1zTlQQgu6klcUboN71ak=; b=GnDmniasaZvsIhU/MdARrJMtVm
 bpDgRiwSWwXtWhaJgbaZ9hwM5F1kdtc80B5Is5RSYc9+KGS/yaf66PBO3YZdzSXRkyeN4hrhIhr8M
 bmeMfu/RTfHWdjs9gmIwYoDKKxYGrbyOZbOtSfTN9fVPwPBlLB6IcL1lYItYxJe85dfU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QDnp4eLfPkrNB753JlPHc4+1zTlQQgu6klcUboN71ak=; b=IILgMsLdGSkA+ABpVTNkK+J6Up
 VTZB7npb1td4GHQhYdpYP2Q9mKWXR7BhicoIyQ12U+w2YvuPcQCrgjyVzPjdlMT3+Q0XCW2RXzL4O
 ZcQTm0rQfOigJc9BCLrGB9FqxFha63dhYs6CN+fMKH+dshC7nvBTQFVpv9Ld7HUHJrkw=;
Received: from mail-wr1-f41.google.com ([209.85.221.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rwgJq-0003ai-Ic for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Apr 2024 10:45:43 +0000
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-344047ac7e4so3122734f8f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 16 Apr 2024 03:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713264331; x=1713869131; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QDnp4eLfPkrNB753JlPHc4+1zTlQQgu6klcUboN71ak=;
 b=EFmCUAx3qS/5eiAAvCfZkdlR4gd37UeLaF6pMWHLgWmkL9jWVynEQcH1lQFIqNpmlN
 P/HK7LiR9eFM3aTq9IIPJD5UW3DzA7Zci1B3FvXtwyWEoVasto9OxvPPr2/UwNllpXwJ
 4PvxG5Ju/o6yQr0siVNrKMNarSUUonJeKCN+UGobBQ8+cnpafd4XZ0IE4saIs0MSXypZ
 ZwD/b8npX5lE3PU2q6ZlbfljJXgy/dpJFBYTJfJDFMdZLAqW4ix60fnIoL3daf+GUKNy
 iSI2qNjZIu5D0KiZjiT8lZiB+dRqapf4bVUkzNDaHPi3HyjDE03YIKYOA219MduA1ke/
 JfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713264331; x=1713869131;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QDnp4eLfPkrNB753JlPHc4+1zTlQQgu6klcUboN71ak=;
 b=WxMzgyBODnJid02Sl0Wsu5NxcZnHnVK7qY/UR62/7K+ZFWsp5AxHKNKoeWaQ/DCJzJ
 x3YZIGgtC8qvt19VH4oPVMwpnLlFcmpgMFp9YKpImui1VG8C0F9LMp+SQs6Az65wkR09
 9Ia4nIqRXXru5v5y4C7yFav53YhgiuEffE+BvALCwSZfFtpp/jAEDjYMv9Gs07nk30iM
 W5O1OB3rQxZBGaZRAF4v03i3o8/x7XxldIgeL95+0CXOLnxVRqlflZ34xwebYOi1AsTC
 T5NG1Y8IUTxtMqEEg1n6vwizHJsCWKH2BT3jY+g1p+wBsWT5zgJEbafyDMuob9JWS5SO
 24hg==
X-Gm-Message-State: AOJu0YwQRlZay//NAB6q3urCnS+BUXpgpweDjcOrp6ifFuVjVkDPSGcT
 WxjaI4YG5FJlngamtTif4zxMw+wQBxcGMN/EqhOFxRxzlNnpmJEg+jLtAb/mf88=
X-Google-Smtp-Source: AGHT+IH4V0nJ0IbIq7+Gy8ZKpjgJlFIuArenwe3np61zZYLEgAJqgIqvpK3dmZ31ad7F49jjBFBo7A==
X-Received: by 2002:a5d:4c88:0:b0:341:b5ca:9e9c with SMTP id
 z8-20020a5d4c88000000b00341b5ca9e9cmr1166182wrs.25.1713264330911; 
 Tue, 16 Apr 2024 03:45:30 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a5d6709000000b00343956e8852sm14470141wru.42.2024.04.16.03.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 03:45:29 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Tue, 16 Apr 2024 11:43:23 +0100
MIME-Version: 1.0
Message-Id: <20240416-kgdb_read_refactor-v1-6-b18c2d01076d@linaro.org>
References: <20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org>
In-Reply-To: <20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1252;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=No+HsEC4lvrte5CQLSZAJe5KYulPb9Qk3KwsfZcxvK4=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmHlak3MpSVd7zzCBYLcWcUnSJ8K/53hRJu8yhr
 GMrGpv8lp2JAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZh5WpAAKCRB84yVdOfeI
 odblD/0TgD4iWnIA0n+xb+oa/t0dw6hBfpt99NOIsG3UDXseZ1OVUO+/YvMrOyml99r6JWRotji
 p11AIGLxH5UYWkPVQFhAqd49dxe2jFYd2i+kHBHa0KQ+w1bjP3lZgmckLhfJthEot79zQoC2tUn
 hR6FboiH7BUSCUfBwgPAK8fMb9Gu9K9Ok0zTUXEyoyS9hDOwMxLvwIPmZ4Tv0rgSgwqS22+jx90
 BiKK7OxhBNHlIVj7ZF+9fwMWlsDVsI882NNPD2jeDWrXrrBcnCaGSc90dgvzcPBibDIVqniHA86
 RC0AnpntSr0tzmo33pkhKvpj/mBArS4oXehvM2p6NUV/ucMJq9+cf5dBfmrCz+7tS6w4Tr17Kaf
 ejVsIENVZTQ7J/OugTHhw39W72wWnRHBZpNoxXDTsBQ74SOrsh6NbVxBcygktDmpuQr3XZNueYC
 oCIfSDmw1+IMWnuo5u/juNfVl6NnRKo1r6kvcXHhbQw/27qbFKQNYYc+/frasxs58r/KwazG/sU
 Ok3F2rXM6gzvItBB8WK+9a6mkl/6a1voV5a5Ql8cvYyA59AIUGYTF4qeyI9bNLI1z/0X3SveK7f
 ihciB57kdTcSE9pK6VGsjSUZPYYUYGWmvRUg+i94wEC8UDgXiL99EeFw6Qf/cErO0iyas6hKAlY
 R8sE4B9A600rhEA==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently when the current line should be removed from the
 display kdb_read() uses memset() to fill a temporary buffer with spaces.
 This can be trivially implemented using a format string. Make it so! 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.41 listed in wl.mailspike.net]
X-Headers-End: 1rwgJq-0003ai-Ic
Subject: [Kgdb-bugreport] [PATCH 6/7] kdb: Use format-specifiers rather than
 memset() for padding in kdb_read()
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

Currently when the current line should be removed from the display
kdb_read() uses memset() to fill a temporary buffer with spaces.
This can be trivially implemented using a format string. Make it so!

Note that this also simplifies the code by making the tab-completion
code the only code that uses tmpbuffer (and therefore makes reviewing
to ensure tmpbuffer can never overflow much easier).

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 08a86a329eb64..94a638a9d52fa 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -295,11 +295,9 @@ static char *kdb_read(char *buffer, size_t bufsize)
 		break;
 	case 14: /* Down */
 	case 16: /* Up */
-		memset(tmpbuffer, ' ',
-		       strlen(kdb_prompt_str) + (lastchar-buffer));
-		*(tmpbuffer+strlen(kdb_prompt_str) +
-		  (lastchar-buffer)) = '\0';
-		kdb_printf("\r%s\r", tmpbuffer);
+		kdb_printf("\r%*c\r",
+			   (int)(strlen(kdb_prompt_str) + (lastchar - buffer)),
+			   ' ');
 		*lastchar = (char)key;
 		*(lastchar+1) = '\0';
 		return lastchar;

-- 
2.43.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
