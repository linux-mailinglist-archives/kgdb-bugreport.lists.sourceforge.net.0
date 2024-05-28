Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C17368D2251
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 May 2024 19:19:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sC0UP-0001Id-6R
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 28 May 2024 17:19:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sC0UN-0001IV-FF
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 28 May 2024 17:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nzuk/A/LDTekVmucccKhiVtGzJSwoK5rWUuC5nM9gSY=; b=h0J4OSw3cccVs7ZPDUnZUbbNrt
 dzai2e2jbfOmvptbEhjOgFpyQPDurlvac5ScuTKfew2NNKQ7/LqJ3+FOB3ECPDjM8Wuqv+i9W8AMF
 2sHY7fYf8ZPP4hi22FdQMIg37gulyR3yne0xuiFAUEhAjs7GsnNadEBj2+vDXfrh7U0c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Nzuk/A/LDTekVmucccKhiVtGzJSwoK5rWUuC5nM9gSY=; b=m
 q3I7qx/MAO7gRHJTOA8+ce6HEkoHgXwWgkXN4I6Bp3mJcvXZjRmjKPm0wuLVMdz2K/KvDgrPzDQRP
 0S5L+TDIvYGnT9LL989aX1uQJplHz4WxDkTYTb3x7Bj/TuII/OXURB55+gMp5Hd9RMK7hfWqEIxp6
 GZG9xkAvqkSsBLdA=;
Received: from mail-yb1-f179.google.com ([209.85.219.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sC0UN-0001gJ-2R for kgdb-bugreport@lists.sourceforge.net;
 Tue, 28 May 2024 17:19:54 +0000
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-df7607785e9so1034323276.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 May 2024 10:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716916788; x=1717521588;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nzuk/A/LDTekVmucccKhiVtGzJSwoK5rWUuC5nM9gSY=;
 b=bwZHatU/jlxd+6oJ8rQYBTWKFX8ykgn12cHV1UXK8aMjDwPnyBwrua+QQZvXFPkn34
 pFUJzMkTWFiTMivG6HNEfw4Bc0zKiFjLsqputYYub33jEdH0JnXmebuuDG1lWIa194+V
 3eh3PS0d9st/YeYB0RGdmxhObeZcnClPlCPx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716916788; x=1717521588;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nzuk/A/LDTekVmucccKhiVtGzJSwoK5rWUuC5nM9gSY=;
 b=NbCivelBCkh89HEWD/uWFK5Pw4BQWo6iopdynbkgQYcKikoOCnf3Elb+1RqFsBl6IU
 1jYRD4iyMSPA2oke6WMwx9/nrIa6MzAx7tu6PzuPnArP9lSLhzrbaz00/S35ukTgMQeL
 55u/fOx0Eoi/eTjrefGzqKlWz2WkxrJomEzdPDvvSnJgH95N/0QUEHPIV2qPn8DQ3ZOc
 BBNm4Dr3WhAN75hlGGzJvMusdSgo5khjydZzhKy6BF2zH1UmKQ2SRiOxCjm/YrKQFcWs
 E3iJfDB0mauGI9jqdJhoCZhp9WkPS051RJTDZRP9azFuH5zEppNI/HozuZmz8FpPmijX
 OvLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTaeF+9E8BcThWqt6qXjucJQulRObxtQouVl+xcsFhmolirVIlElMxPJ0YdKHON+1skxsx/EDfJWwnRgdQhCpHxJwsdCQ6+QaSbi1lpHOsYL/aGAM=
X-Gm-Message-State: AOJu0Yyu0+frunlDgD3DA9CqFtB05hDPkfi0hqe4/f97L11JMaiiHagx
 Ar2pzDFkLBmse+7g+j4aiPKCfhioLXS6gd7Q9ktZc7ll04s38E3JJZE1m/Sw+R+REtJFS8l3UN8
 =
X-Google-Smtp-Source: AGHT+IGq2Ds3m0hTxoYo8DC9tg/dA1K51TXxuSsGl6i4q1RywM8QvwUmEyVSYF/f1J6pen3F1Uf0fQ==
X-Received: by 2002:a17:902:ce92:b0:1f4:9308:2ddb with SMTP id
 d9443c01a7336-1f493083073mr67439795ad.59.1716905545979; 
 Tue, 28 May 2024 07:12:25 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:95f4:6142:6041:6962])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c9dd375sm80461445ad.288.2024.05.28.07.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 07:12:25 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Tue, 28 May 2024 07:11:48 -0700
Message-ID: <20240528071144.1.I0feb49839c6b6f4f2c4bf34764f5e95de3f55a66@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The function kdb_position_cursor() takes in a "prompt"
 parameter
 but never uses it. This doesn't _really_ matter since all current callers
 of the function pass the same value and it's a global variabl [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.179 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.219.179 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.219.179 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.179 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sC0UN-0001gJ-2R
Subject: [Kgdb-bugreport] [PATCH] kdb: Use the passed prompt in
 kdb_position_cursor()
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
Cc: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The function kdb_position_cursor() takes in a "prompt" parameter but
never uses it. This doesn't _really_ matter since all current callers
of the function pass the same value and it's a global variable, but
it's a bit ugly. Let's clean it up.

Found by code inspection. This patch is expected to functionally be a
no-op.

Fixes: 09b35989421d ("kdb: Use format-strings rather than '\0' injection in kdb_read()")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 3131334d7a81..8e98446564a9 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -206,7 +206,7 @@ char kdb_getchar(void)
  */
 static void kdb_position_cursor(char *prompt, char *buffer, char *cp)
 {
-	kdb_printf("\r%s", kdb_prompt_str);
+	kdb_printf("\r%s", prompt);
 	if (cp > buffer)
 		kdb_printf("%.*s", (int)(cp - buffer), buffer);
 }
-- 
2.45.1.288.g0e0cd299f1-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
